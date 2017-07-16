#include <winsock2.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <sys/stat.h>
#include <dirent.h>
#include <assert.h>


#include "../firmware/timer/timer.h"
#define SERVER "webserver/1.0"
#define PROTOCOL "HTTP/1.1"
#define RFC1123FMT "%a, %d %b %Y %H:%M:%S GMT"
#define PORT 80
#define CMD_SETUP "echo y | timer-tool.exe setup "
#define TIMER_SETUP "timer_setup"
#define TIMER_READ  "timer_read"
#define PRE_CHAR '$'
#define PRE_CHAR__ '"'


#define OPTION_GROUPS "-g "


#define HTM_FILE_TEMPLATE "index__.htm"
#define HTM_FILE "index.htm"
#define HTM_VALUES 32
#define HTM_SIZE 4096

#define CMD_READ2LOG "echo y | timer-tool.exe read > timer.log"
#define LOG_FILE "timer.log"
#define PATTERN_LEN 128
  
#include "ctype.h"      
#include <stdlib.h>     
#define MAXLINE 1024     



struct form_entry{
	char* name;
	char* option;
	char* value;
};
typedef struct form_value__{
	char* dest;
	char* src;
}form_value_t;	
	

char* htm_replace(char* htm_buffer, char pre_char_dest, char pre_char_src,  char* pattern_dest, char* pattern_src)
{
	char* head;
	char* __pattern;
	
//	printf("to be replaced:%s\n",pattern_dest);
//	printf("to replace    :%s\n",pattern_src);
	__pattern = malloc(strlen(pattern_dest)+2) ;
	*__pattern = pre_char_dest;
	strcpy(__pattern+1,pattern_dest);
//	printf("pattern:%s\n",__pattern);
	head  = strstr(htm_buffer,__pattern);    // change '$timer_setup___$' to '"timer_setup"'
	*head = pre_char_src;
//	printf("before replacement:%s\n",head);
	strcpy(head+1,pattern_src);

	head += strlen(pattern_src)+1;
	*(head) = pre_char_src;  //encode '\0' to space. 
	head++;
	while(*(head) != pre_char_dest) 
	{
		*head = ' '; //treat remain to space until '$'
		head++;
	}
	*head = ' ';  //treat '$' to space
//	printf("%s\n",htm_buffer);
	return head++;
}

/*---------------------format to RTC or integer--------------------------------*/
void sprintf_RTC(char* option_str,unsigned short value_time, int RTC_flag )
{
	unsigned char* minute = (unsigned char*)&value_time;
	unsigned char* hour = minute + 1;
	if(RTC_flag == YES){
		sprintf(option_str,"%d:%d",*hour,*minute);
	}else{
		sprintf(option_str,"%d",value_time);
	}
	
}
/*---------------------generate htm page from template file--------------------*/
char* update_page(SOCKET ClientSocket,char *htm_temp_path,char* htm_path)
{

	char* select_power_type[2]={ 
		"<option value=\"AT\" > AT 电源 </option>",  
		"<option value=\"ATX\"> ATX电源 </option>"};
	char* select_time_unit[4]= { 
		"<option value=\"s\"> 秒-second </option>",  
		"<option value=\"m\"> 分-minute </option>",  
		"<option value=\"h\"> 时-hour </option>",  
		"<option value=\"d\"> 实时-realtime in minutes </option>"};
	char* tmp_option;
	int RTC_flag=NO;
	form_value_t form_value[HTM_VALUES];  //values need to be updated in htm page
	char* option_str;
	int form_index=0;
	int cur_select;
	int len=0;
	char sendbuf[HTM_SIZE]={0x0};
	timer_status_t* pStatus_timer;
	timer_config_t* pConfig_timer;
	timer_group_t* pGroup_timer;
	unsigned char* pRTC_minute;
	unsigned char* pRTC_hour;
	
	
	
	FILE* log_file;
	FILE* htm_file_template;
	
	char* buf_end;
	char* buf_head;
	char* htm_buffer;
	char* log_buffer; // log file must < 2048 bytes
	char  timer_eeprom[EEPROM_USED_SIZE]={0x0};  
	struct stat sb;
	int i,file_size;
	time_t timer;
	char time_str[64]={0};
	timer=time(NULL);
	strftime(time_str, sizeof(time_str), RFC1123FMT, gmtime(&timer));

	system(CMD_READ2LOG);  // call CMD_READ2LOG to generate eeprom image log
	log_file  = fopen(LOG_FILE,"r"); 
	fstat(fileno(log_file), &sb);
	file_size = sb.st_size;
	log_buffer = malloc(file_size+1);
	fread(log_buffer,1,file_size,log_file);
	fclose(log_file);

	buf_head = strchr(log_buffer,'\n');  //skip first unused line
//	printf("%s\n",buf_head);
	for (i=0;i< sizeof(timer_eeprom);i++){
	  timer_eeprom[i] = strtol(buf_head,&buf_end,0);
	  buf_head = buf_end;
	  printf("%d ", timer_eeprom[i]);
	}
	pConfig_timer = &timer_eeprom;
	pStatus_timer = ((char*)&timer_eeprom) + sizeof(timer_config_t);
	pGroup_timer  = ((char*)&timer_eeprom) + sizeof(timer_config_t) + sizeof(timer_status_t);
	pRTC_minute   = ((char*)&timer_eeprom) + sizeof(timer_eeprom) -4;
	pRTC_hour     = pRTC_minute + 1;
	free(log_buffer);
	if(pConfig_timer->time_unit == DAY)
		RTC_flag = YES;
	
	  

	htm_file_template  = fopen(htm_temp_path,"r");
	fstat(fileno(htm_file_template), &sb);
	file_size = sb.st_size;
	htm_buffer= malloc(file_size+1); 
	fread(htm_buffer,1,file_size,htm_file_template);
	fclose(htm_file_template);
	htm_buffer[file_size]='\0'; 
//	printf("%s\n",htm_buffer);
	

	if (pConfig_timer->power_type != POWER_AT);{  //select current option to show first 
		tmp_option = select_power_type[0];
		cur_select = pConfig_timer->power_type - 1;
		select_power_type[0] = select_power_type[cur_select];
		select_power_type[cur_select] = tmp_option; 
	}
//	printf("select_power_type:\n %s\n %s\n", select_power_type[0],select_power_type[1]);
	

	if (pConfig_timer->time_unit != SECOND);{  //select current option to show first 
		tmp_option = select_time_unit[0];
		cur_select = pConfig_timer->time_unit - 1;
		select_time_unit[0] = select_time_unit[cur_select];
		select_time_unit[cur_select] = tmp_option; 
	}
//	printf("select_time_unit:\n %s %s %s %s", select_time_unit[0],select_time_unit[1],select_time_unit[2],select_time_unit[3]);
	
	form_index=0;
	form_value[form_index].dest = TIMER_SETUP;
	form_value[form_index].src  = TIMER_SETUP;
//	printf("::: %s ; %s\n", form_value[form_index].dest,form_value[form_index].src);
	form_index++;
	form_value[form_index].dest = TIMER_READ;
	form_value[form_index].src  = TIMER_READ;	

	form_index++;
	option_str = malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN
	if(RTC_flag == YES)
		sprintf(option_str,"当前时%d:%d",(int)*pRTC_hour, (int)*pRTC_minute );
	else
		sprintf(option_str,"已运行%d:%d",(int)*pRTC_hour, (int)*pRTC_minute );
	form_value[form_index].src = option_str;
	option_str = malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN
	sprintf(option_str,"%s","_time");
	form_value[form_index].dest = option_str;



//	printf("::: %s ; %s\n", form_value[form_index].dest,form_value[form_index].src);

	for(i=1;i<3;i++){   //update select_power_type 
		option_str = (char*) malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN 
		sprintf(option_str,"option_t%d",i);
		form_index++;
		form_value[form_index].dest = option_str;
		form_value[form_index].src  = select_power_type[i-1];
//		printf("::: %s ; %s\n", form_value[form_index].dest,form_value[form_index].src);
	}
	for(i=1;i<5;i++){   //update select_time_unit
		option_str = malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN
		sprintf(option_str,"option_u%d",i);
		form_index++;
		form_value[form_index].dest = option_str;
		form_value[form_index].src  = select_time_unit[i-1];
//		printf("::: %s ; %s\n", form_value[form_index].dest,form_value[form_index].src);
	}
	form_index++;
	option_str = malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN
	sprintf(option_str,"%d",pStatus_timer->count1);
	form_value[form_index].dest = "remain_cycles";
	form_value[form_index].src  = option_str;

	form_index++;
	option_str = malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN
	sprintf(option_str,"%d",pConfig_timer->count);
	form_value[form_index].dest = "cycles";
	form_value[form_index].src  = option_str;

//	printf("::: %s ; %s\n", form_value[form_index].dest,form_value[form_index].src);

	form_index++;
	option_str = malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN
	//sprintf(option_str,"%d",pConfig_timer->down_time );
	sprintf_RTC(option_str,pConfig_timer->down_time,RTC_flag );
	form_value[form_index].dest = "dtime0";
	form_value[form_index].src  = option_str;
//	printf("::: %s ; %s\n", form_value[form_index].dest,form_value[form_index].src);
	
	form_index++;
	option_str = malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN
	sprintf(option_str,"%d",pConfig_timer->up_time );
	form_value[form_index].dest = "utime0";
	form_value[form_index].src  = option_str;
//	printf("::: %s ; %s\n", form_value[form_index].dest,form_value[form_index].src);
		
	
	for(i=1;i<9;i++){   //update group settings
		form_index++;
		option_str = malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN
		sprintf(option_str,"dtime%d",i);
		form_value[form_index].dest = option_str;
		option_str = malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN
		sprintf_RTC(option_str, pGroup_timer->down_time, RTC_flag );
		form_value[form_index].src  = option_str;
//		printf("===>%s ; %s\n", form_value[form_index].dest,form_value[form_index].src);

		form_index++;
		option_str = malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN
		sprintf(option_str,"utime%d",i);
		form_value[form_index].dest = option_str;
		option_str = malloc(PATTERN_LEN);  // string replaced must less than PATTERN_LEN
		sprintf(option_str,"%d", pGroup_timer->up_time );
		form_value[form_index].src  = option_str;		
//		printf("--->%s ; %s\n", form_value[form_index].dest,form_value[form_index].src);
		
		pGroup_timer++;
	}
/*now all required replacement have been structed in form_value[] with size of form_index */

/*do all replacement here , and free used heap memory*/
	for(i=0;i<form_index+1;i++){
		htm_replace(htm_buffer, PRE_CHAR, PRE_CHAR__, form_value[i].dest, form_value[i].src);
	}


// send http header  	
	len = sprintf(sendbuf,"%s 200 OK\r\n",PROTOCOL);     
	len +=sprintf(sendbuf+len,"Content-Type: %s\r\n","text/html"); //char-coding=utf-8   
	len +=sprintf(sendbuf+len,"Content-Length: %d\r\n",file_size);
	len +=sprintf(sendbuf+len,"Server: %s\r\n", SERVER);
	len +=sprintf(sendbuf+len,"Date: %s\r\n", time_str);
	len +=sprintf(sendbuf+len,"Last-Modified: %s\r\n", time_str);
	len +=sprintf(sendbuf+len,"Connection: close\r\n");
 	len +=sprintf(sendbuf+len,"\r\n");
	send(ClientSocket,sendbuf,len,0); 

 // send http content  in htm_buffer
	send(ClientSocket,htm_buffer,file_size,0);    
	free(htm_buffer) ; 
		
	strcpy(htm_path,HTM_FILE);
	
	return htm_path;
	

}



/*--------------------------------------------------------------------*/
void parse_form( char* form)
{
	char value1[20]={'\0'};
	char value2[20]={'\0'};
	char value3[20]={'\0'};
	char value4[20]={'\0'};
	char value5[20]={'\0'};
	char value_d1[20]={'\0'};
	char value_u1[20]={'\0'};
	char value_d2[20]={'\0'};
	char value_u2[20]={'\0'};
	char value_d3[20]={'\0'};
	char value_u3[20]={'\0'};
	char value_d4[20]={'\0'};
	char value_u4[20]={'\0'};
	char value_d5[20]={'\0'};
	char value_u5[20]={'\0'};
	char value_d6[20]={'\0'};
	char value_u6[20]={'\0'};
	char value_d7[20]={'\0'};
	char value_u7[20]={'\0'};
	char value_d8[20]={'\0'};
	char value_u8[20]={'\0'};
	char groups[1024]={'\0'};
	struct form_entry entry_0[]={
		{"power_type","-t",value1},
		{"time_unit" ,"-U",value2},
		{"cycles"    ,"-c",value3},
		{"down_time" ,"-d",value4},
		{"up_time"   ,"-u",value5},
		{"down_time1","1d",value_d1},
		{"up_time1" ,"u",value_u1},
		{"down_time2","2d",value_d2},
		{"up_time2" ,"u",value_u2},
		{"down_time3","3d",value_d3},
		{"up_time3" ,"u",value_u3},
		{"down_time4","4d",value_d4},
		{"up_time4" ,"u",value_u4},
		{"down_time5","5d",value_d5},
		{"up_time5" ,"u",value_u5},
		{"down_time6","6d",value_d6},
		{"up_time6" ,"u",value_u6},
		{"down_time7","7d",value_d7},
		{"up_time7" ,"u",value_u7},
		{"down_time8","8d",value_d8},
		{"up_time8" ,"u",value_u8},
		{(char*) 0   ,"-g",groups},
		};

//	char* end;
	char* name;
//	char* last_name;
	char* cmd_name;
	char* value;
	struct form_entry* entry;
	char cmd_line[1024];
	int len;
	
	cmd_name   = strtok(form,"&");
	value = strchr(cmd_name,'=');
	*value= '\0';
	printf("%s\n",cmd_name);
//	int i=0;
	
	name  = strtok(NULL,"&");
	while(name){  // parse  values from string ,such as name1=value1&name2=value2&name3=value3......
		value = strchr(name,'=');
		*value= '\0';
		value++;
//			printf("\n%s,%s",name,value);
		if(*value!='\0' && *value!='0'){
			for(entry = entry_0;*(char*)entry != 0;entry++){
//				printf("\n:::%s,%s",entry->name,entry->value);
				if(!strcmp(entry->name,name)  && !strcmp(cmd_name,TIMER_SETUP) ) {//setup here
					//i++;
					strcpy(entry->value,value);
					printf("found value:%s\n",value);  // !!!, do not comment this line , or it works queerly.
					value = strchr(entry->value,'%'); //reuse value here , encode '%3A' to ':00'
					if(value){
						*value = ':';
						value++;
						*value = '0';
						value++;
						*value = '0';
					}
				}
			}
		}
		name  = strtok(NULL,"&");
	}

//	for(entry = entry_0;*(char*)entry != 0;entry++){
//		printf("%s:%s\n",entry->option,entry->value);
//	}
//				
		
	
//	printf("valid entries: %d",i);
	
	if(!strcmp(cmd_name,TIMER_SETUP) ) { // pass to command line to do real work
		len = sprintf(cmd_line,CMD_SETUP); 
		for(entry = entry_0;entry != entry_0+5;entry++){
			len += sprintf(cmd_line+len,"%s %s ",entry->option,entry->value);
		}
		if(*(entry->value) != '\0' ){ // check groups setting , processed here 
			len += sprintf(cmd_line+len,OPTION_GROUPS);
			while(*(entry->value) != '\0' ){ // parse to 1dxxxuxxx__2dxxxuxxx__......
				len += sprintf(cmd_line+len,"%s%s",entry->option,entry->value);
				entry++;
				len += sprintf(cmd_line+len,"%s%s__",entry->option,entry->value);
				entry++; 
			}
		}		
		printf("%s",cmd_line);
		system(cmd_line);	
	}
}
   

void sendfile(SOCKET  ClientSocket, char* path)
{
	int len=0;
	int file_size=0;
	char sendbuf[HTM_SIZE]={0x0};
	FILE* read_from;
	struct stat sb;
	time_t timer;
	char time_str[64]={0};
	timer=time(NULL);
	strftime(time_str, sizeof(time_str), RFC1123FMT, gmtime(&timer));

	read_from = fopen(path, "r");    
	if(!read_from){    
		printf("打开文件错误");  
		len = sprintf(sendbuf,"HTTP/1.1 404 Not Found\r\n");     
		len +=sprintf(sendbuf+len,"Server: timer-web\r\n");
		len +=sprintf(sendbuf+len,"Date: \r\n");
		len +=sprintf(sendbuf+len,"Connection: close\r\n");
	 	len +=sprintf(sendbuf+len,"\r\n");
		send(ClientSocket,sendbuf,len,0); 
		return 0;  
	}    
	fstat(fileno(read_from), &sb);
	file_size = sb.st_size;
	
	printf("file: %s\n",path);
	printf("file size: %d bytes\n",file_size);  
	len = sprintf(sendbuf,"%s 200 OK\r\n",PROTOCOL);     
	len +=sprintf(sendbuf+len,"Content-Type: %s\r\n","text/html"); //char-coding=utf-8   
	len +=sprintf(sendbuf+len,"Content-Length: %d\r\n",file_size-107);
	len +=sprintf(sendbuf+len,"Server: %s\r\n", SERVER);
	len +=sprintf(sendbuf+len,"Date: %s\r\n", time_str);
	len +=sprintf(sendbuf+len,"Last-Modified: %s\r\n", time_str);
	len +=sprintf(sendbuf+len,"Connection: close\r\n");
 	len +=sprintf(sendbuf+len,"\r\n");
	send(ClientSocket,sendbuf,len,0); 
	printf("%s\n",path);    

 	while((len = fread(sendbuf, 1, sizeof(sendbuf), read_from)) > 0 )    
	{    
		send(ClientSocket,sendbuf,len,0);    
	}
	fclose(read_from);
}

   
DWORD  WINAPI  AnswerThread(LPVOID  lparam)      
{      
	SOCKET  ClientSocket=(SOCKET)(LPVOID)lparam; 
//	FILE* read_from;
//	FILE* log_file;
// 	char* content_type = "text/html";       
//	int n;
//	int content_length=0;	
	char* form; 
//	char* end;  
	time_t timer;
	char time_str[64]={0};
//	int file_size=0;
//	int len = 0;
//	struct stat sb;
	char* method;
	char* path;
	char* protocol;
	
	char htm_path[256];
//	char log_buffer[2048]={0x0};   
//	char sendbuf[4096]={0x0};     
	char recvbuf[MAXLINE]={0x0};
	printf("接受文件头开始\n"); 
	if(recv(ClientSocket,recvbuf,MAXLINE,0)==SOCKET_ERROR)    
	{    
		printf("接受错误");    
	}  
	printf("接受文件头结束\n"); 
	printf("%s\n",recvbuf); 

	timer=time(NULL);
	strftime(time_str, sizeof(time_str), RFC1123FMT, gmtime(&timer));
	method = strtok(recvbuf, " ");
	path = strtok(NULL, " ");
	path++;  //discard '/'
	protocol = strtok(NULL, "\r");
	

	
	printf("%s;\n%s;\n%s;\n",method,path,protocol);
	
	if(strcmp("POST",method) == 0){ // process form apply
		form=protocol;
		while( *form != '\0') form++; //locate to remain string after protocol
		form++;
		form = strrchr(form, '\n'); //locate to head of form apply
		form++;
		printf("form :\n%s",form);  //debug form apply content
		
		if ( strncmp(form,"timer_read",strlen("timer_read")) == 0){ // read setup & status
			printf("\nread config and status from eeprom\n");
			update_page(ClientSocket, HTM_FILE_TEMPLATE, htm_path );
//			sendfile(ClientSocket,htm_path); 
		}else{  // setup
			parse_form(form);    //read or write for form apply
		}
			
		
		
	}
		
	if(strcmp("GET",method) == 0){ // process form apply
		update_page(ClientSocket,HTM_FILE_TEMPLATE, htm_path );
//		sendfile(ClientSocket,htm_path); 
	}

	return  0;      
}      
   
   
int main(void)    
{    
	WSADATA              wsaData;    
	SOCKET               ListeningSocket;    
	SOCKET               NewConnection;    
	SOCKADDR_IN          ServerAddr;    
	int                  ClientAddrLen;    
	int                  Port = 6789;    
	int                  Ret;    
	   
	   
	if ((Ret = WSAStartup(MAKEWORD(2,2), &wsaData)) != 0)    
	{    
		printf("初始化winsock版本错误 %d\n", Ret);    
		return -1;    
	}    
	   
	   
	if ((ListeningSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP))     
	== INVALID_SOCKET)    
	{    
		printf("监听socket初始化错误 %d\n", WSAGetLastError());    
		WSACleanup();    
		return -1;    
	}     
	   
	   
	ServerAddr.sin_family = AF_INET;    
	ServerAddr.sin_port = htons(Port);        
	ServerAddr.sin_addr.s_addr = htonl(INADDR_ANY);    
	   
	   
	if (bind(ListeningSocket, (SOCKADDR *)&ServerAddr, sizeof(ServerAddr))     
	== SOCKET_ERROR)    
	{    
		printf("绑定地址错误 %d\n", WSAGetLastError());    
		closesocket(ListeningSocket);    
		WSACleanup();    
		return -1;    
	}    
	   
	   
	if (listen(ListeningSocket, 5) == SOCKET_ERROR)    
	{    
		printf("监听错误 %d\n", WSAGetLastError());    
		closesocket(ListeningSocket);    
		WSACleanup();    
		return -1;    
	}    
	   
	   
	while(1)      
	{      
	   
		if ((NewConnection = accept(ListeningSocket,NULL,NULL)) == INVALID_SOCKET)    
		{    
			printf("接收错误 %d\n", WSAGetLastError());    
			closesocket(ListeningSocket);    
			WSACleanup();    
			return -1;    
		}     
//		FILE* f;
//		f = fdopen(NewConnection, "r+");
//		printf("%d",f);
//		if (f<0)
//		{    
//			printf("接收错误 %d\n", WSAGetLastError());    
//			closesocket(ListeningSocket);    
//			WSACleanup();    
//			return -1;    
//		}     		  
//		process(f); 	   
	   
		DWORD  dwThreadId;      
		HANDLE  hThread;      
		printf("创建线程开始.\n");   
		hThread=CreateThread(NULL,NULL,AnswerThread,(LPVOID)NewConnection,0,&dwThreadId);
		printf("创建线程结束.\n");   
		      
		if(hThread==NULL)      
		{      
			printf("创建线程错误.\n");      
		}    
	}    
	return 0;  
}    

