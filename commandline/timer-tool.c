#include <stdio.h>
#include <getopt.h>
//#include <getopt-int.h>


#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <windows.h>
#include "../firmware/timer/timer.h"
#include "hiddata.h"
#include "../firmware/usbconfig.h"  /* for device VID, PID, vendor name and product name */



#define BUFFER_SIZE 1024
#define DEFAULT_ON_DURATION 40
#define DEFAULT_OFF_DURATION 30
#define DEFAULT_CYCLE_COUNT 300
#define DEFAULT_POWER_TYPE POWER_AT


char cmd_out[65536] = {0,};
char* cmd_out_cpp = cmd_out;
int out_len  = 0;



#ifdef GUI
void str2array(int* argc, char** argv, char* cmd_buffer,char* cmd_name)
{
	char* pHead = cmd_buffer;
	char* pTail = cmd_buffer;
	
	int len = 0;
	*argc = 0;
	if ( cmd_name != (void*)0 )
	{
		len = strlen(cmd_name);
		argv[0] = new char[len + 1 ];
		strncpy(argv[0],cmd_name,len);
		*(argv[0] + len) = '\0';
		(*argc)++;
	}
	while(*pTail != '\0'){
		while((*pHead == ' ') || (*pHead == '\t') ){
			pHead++;
			if (*pHead == '\0') break;
		}
		pTail = pHead;
		while( *pTail != ' ' && *pTail != '\0') 
			pTail++;
		len = pTail - pHead;
		if (len !=0){
			argv[*argc] = new char[len + 1 ]; // 1bytes extra for '\0' string_tail
			wxStrncpy(argv[*argc],pHead,len);
			*(argv[*argc]+len) = '\0';
			(*argc)++; 
		}
		pHead = pTail;  // not end yet, continue...
	}	
	
}
#endif  //GUI



//#definesprintf(pCurrent,D...)  {sprintf(pCurrent, D); pCurrent = cmd_out + strlen(cmd_out); }


/* ------------------------------------------------------------------------- */
//static char* myName;
 char *usbErrorMessage(int errCode)
{
 char buffer[80];

    switch(errCode){
        case USBOPEN_ERR_ACCESS:      return "Access to device denied";
        case USBOPEN_ERR_NOTFOUND:    return "The specified device was not found";
        case USBOPEN_ERR_IO:          return "Communication error with device";
        default:
            sprintf(buffer, "Unknown USB error %d", errCode);
            return buffer;
    }
    return NULL;    /* not reached */
}

 usbDevice_t  *openDevice(void)
{
	usbDevice_t     *dev = NULL;
	unsigned char   rawVid[2] = {USB_CFG_VENDOR_ID}, rawPid[2] = {USB_CFG_DEVICE_ID};
	char            vendorName[] = {USB_CFG_VENDOR_NAME, 0}, productName[] = {USB_CFG_DEVICE_NAME, 0};
	int             vid = rawVid[0] + 256 * rawVid[1];
	int             pid = rawPid[0] + 256 * rawPid[1];
	int             err;

    if((err = usbhidOpenDevice(&dev, vid, vendorName, pid, productName, 0)) != 0){
        out_len += sprintf(cmd_out+out_len, "error finding %s: %s\n", productName, usbErrorMessage(err));
       
        return NULL;
    }
    return dev;
}

/* ------------------------------------------------------------------------- */

 void hexdump(char *buffer, int len)
{
int     i;
FILE    *fp = stdout;

    for(i = 0; i < len; i++){
        if(i != 0){
            if(i % 16 == 0){
                out_len += sprintf(cmd_out+out_len, "\n");
            }else{
                out_len += sprintf(cmd_out+out_len, " ");
            }
        }
        out_len += sprintf(cmd_out+out_len, "0x%02x", buffer[i] & 0xff);
    }
    if(i != 0){
        out_len += sprintf(cmd_out+out_len, "\n");
	}   
}

 int  hexread(char *buffer, char *string, int buflen)
{
char    *s;
int     pos = 0;

    while((s = strtok(string, ", ")) != NULL && pos < buflen){
        string = NULL;
        buffer[pos++] = (char)strtol(s, NULL, 0);
    }
    return pos;
}


void format_output(char* buffer, int len)
{
	int i;
	timer_config_t* timer1_config = (char*)buffer;
	timer_status_t* timer1_status = (char*)buffer+sizeof(timer_config_t);
	timer_group_t*  timer1_group  = (char*)buffer+sizeof(timer_config_t)+sizeof(timer_status_t);
	down_time_t* down_time_rtc;

	if(timer1_status->status == RUNNING ){
		out_len += sprintf(cmd_out+out_len,"已循环%d次, 共循环%d次后停止运行.\n",timer1_config->count-timer1_status->count1,timer1_config->count);
	}else{
		out_len += sprintf(cmd_out+out_len,"已完成设定循环 %d 次, 并停止运行.\n", timer1_config->count);
	}
	if(timer1_config->power_type == POWER_AT){
		out_len += sprintf(cmd_out+out_len,"电源类型: AT\n");
	}else{
		out_len += sprintf(cmd_out+out_len,"电源类型: ATX\n");
	}switch (timer1_config->time_unit){
	case (SECOND):
		{
			out_len += sprintf(cmd_out+out_len,"时间单位: 秒\n");
		}
		break;
	case (MINUTE):
		{
			out_len += sprintf(cmd_out+out_len,"时间单位: 分钟\n");
		}
		break;
	case (HOUR):
		{
			out_len += sprintf(cmd_out+out_len,"时间单位: 小时\n");
		}
		break;
	case (DAY):
		{
			out_len += sprintf(cmd_out+out_len,"时间单位: 分钟,实时运行(1周期/天)\n");
		}
		break;
	default:
		break; 
	}

/*output group settings of down_up time*/	
	if (timer1_config->groups == 0){
		if(timer1_config->time_unit == DAY){
			down_time_rtc = & (timer1_config->down_time);
			out_len += sprintf(cmd_out+out_len,"__关机到: %d:%d\n", 
				down_time_rtc->hour,
				down_time_rtc->minute);

		}else{
			out_len += sprintf(cmd_out+out_len,"关机时长: %d\n",timer1_config->down_time);
		}
		out_len += sprintf(cmd_out+out_len,"开机时长: %d\n",timer1_config->up_time);
		
	}else{
		for(i=0;i < timer1_config->groups;i++){
			if(timer1_config->time_unit == DAY){
					down_time_rtc = & (timer1_group->down_time);
					out_len += sprintf(cmd_out+out_len, "%d->__关机到: %d:%d\n",i, down_time_rtc->hour, down_time_rtc->minute );
			}else{
				out_len += sprintf(cmd_out+out_len,"%d->关机时长: %d\n",i,timer1_group->down_time);
			}
			out_len += sprintf(cmd_out+out_len,"%d->开机时长: %d\n",i,timer1_group->up_time);
			timer1_group++;		
		}
	
/*output running time*/	
		if(timer1_config->time_unit == DAY){
			out_len += sprintf(cmd_out+out_len,"当前时间是 %d:%d\n", *((unsigned char*) (buffer + ADDR_RTC_STORAGE+1)), *((unsigned char*) (buffer + ADDR_RTC_STORAGE)));
			out_len += sprintf(cmd_out+out_len,"共运行: %d天\n", *((unsigned short*) (buffer + ADDR_RTC_STORAGE + 2)));
		}else{
			out_len += sprintf(cmd_out+out_len,"当前时间是 %d:%d\n", *((unsigned char*) (buffer + ADDR_RTC_STORAGE+1)), *((unsigned char*) (buffer + ADDR_RTC_STORAGE)));
			out_len += sprintf(cmd_out+out_len,"共运行 %d 天, %d 小时, %d 分\n", 
				*((unsigned short*) (buffer + ADDR_RTC_STORAGE + 2)),
				*((unsigned char*) (buffer + ADDR_RTC_STORAGE+1)), 
				*((unsigned char*) (buffer + ADDR_RTC_STORAGE)));
		}
		
	}


}

/* ------------------------------------------------------------------------- */



/* run this program using the console pauser or add your own getch, system("pause") or input loop */
void usage(const char* myName)
{
#ifdef TEST
	out_len += sprintf(cmd_out+out_len,"usage: %s command [options] \n\n", myName);
#else
	out_len += sprintf(cmd_out+out_len,"usage: command [options] \n\n");
#endif 

    out_len += sprintf(cmd_out+out_len,
        "command is either of:\n"
        "   setup: must have options as below\n"
        "   read : no options \n"
        "   write <listofbytes>: with listofbytes to be written, separated by ',' \n\n\n"
		"Options are:\n"
        "   -h or -? (print this help and exit)\n"
        "   -U s|m|h|d (time unit,default s=second,m=minute,h=hour,d=real_time 24hours per circle)\n"
        "   -u nnn (up time ,default 60)\n"
        "   -d nnn (off time,default 30)\n"
        "   -t AT|ATX (power type, default AT )\n"
        "   -c nnn (default 10,stop after nnn times)\n"
        "   -g 1dxxxuxxx,2dxxxuxxx,3dxxxuxxx,4dxxxuxxx... (group settings of down_time/up_time) \n\n"

		);
}

void debug_print(char *timer_config,int len)
{
	char i;
	char * cPtr = timer_config;
	for (i=0;i<len;i++){
		//item = *cPtr;A
		out_len += sprintf(cmd_out+out_len,"0x%x,",(char)(*cPtr));
		cPtr++;
	}
	
}

/*--------------------------------------------------------------------------------------------------------*/
//unsigned char sBuffer[BUFFER_SIZE];
int debug_sprint(unsigned char* pBuffer, unsigned char *timer_config, int len)
{
	char i,len_=len;
	unsigned char *cPtr = timer_config;
	unsigned char *curPtr = pBuffer;
	if (len > BUFFER_SIZE/5)
		return -1;
	for (i=0;i<len_;i++){
		//item = *cPtr;A
		sprintf(curPtr,"0x%02x,",(unsigned char)(*cPtr));
		cPtr++;
		curPtr +=5;
	}
	*curPtr='\0';
	return 0;
	
}

/*--------------------------------------------------------------------------------------------------------*/
int  myAtoi(char *text)
{
	long    l;
	char    *endPtr;

    if(strcmp(text, "*") == 0)
        return 0;
    l = strtol(text, &endPtr, 0);
    if(endPtr == text){
//        fprintf(stderr, "warning: can't parse numeric parameter ->%s<-, defaults to 0.\n", text);
        l = 0;
    }else if(*endPtr != 0){
//        fprintf(stderr, "warning: numeric parameter ->%s<- only partially parsed.\n", text);
		;
    }
    return l;
}

/*--------------------------------------------------------------------------------------------------------*/
void parse_group(char* opt,int* index,timer_group_t* group,unsigned short time_unit ) // asume that , 'dxxx' defines down_time as xxx, 'uxxx' defines up_time as xxx
{
//	char * p_char;
	char *p_value;
	char* next;
	int down='d';
	int up  ='u';
	*index  = strtol(opt,NULL,10);// read index into *index
	p_value = strchr(opt,down);  
	if(time_unit == DAY){// real time end of down,defined as 18:30 
		*((char*)&(group->down_time) + 1)= strtol(p_value+1,&next,10);//down_time's high_byte , is RTC's hour
		*((char*)&(group->down_time))    = strtol(next+1,NULL,10);//down_time's low_byte , is RTC's minute
	}else{
		group->down_time  = strtol(p_value+1,NULL,10); // 'dxxx' defines down_time as xxx here
	}
	p_value = strchr(opt,up);    // 'uxxx' defines up_time as xxx here
	group->up_time = strtol(p_value+1,NULL,10);
}

/*--------------------------------------------------------------------------------------------------------*/
int parse_timer_groups(timer_group_t* timer_groups, char* sBuffer,unsigned short time_unit)// asume that group separator is '__'
{
    
	char *opt;
	int last_index=0,index,i;
	opt = strtok(sBuffer, ","); // group separator is ','
    do {
 		parse_group(opt, &index, timer_groups+last_index,time_unit);
 		last_index = index;
    }while((opt = strtok(NULL, ",")) != NULL);
//   sprintf(pCurrent,"total groups: %d\n",index);
//    for (i=0;i<index;i++){
//    sprintf(pCurrent,"%d->down:%x,up:%d__\n",i,timer_groups[i].down_time,timer_groups[i].up_time );
//    }
    return index;
 
}
enum{
	false = 0,true = 1,
};

extern int optind;

void timer_setup(char* buffer,int argc, char** argv)
{
	int opt;
	char has_group=false;
	char down_arg[1024];
	char group_arg[1024];
	char *next;
	char* myName = argv[0];
//	unsigned char *pGroups;
	timer_config_t* timer1_config = (char*)buffer;
	timer1_config->time_unit = SECOND;
	timer1_config->up_time = 60;
	timer1_config->down_time = 30;
	timer1_config->count = 10;
	timer1_config->power_type = POWER_AT;
	timer_group_t* timer_groups =  (char*)buffer+sizeof(timer_config_t)+sizeof(timer_status_t);
	

	optind = 0;  // getopt below needs initialized
	while((opt = getopt(argc, argv, "U:u:d:c:t:g:")) != -1)
	{
        switch(opt){
        case 'U':   /* time unit, SECOND|MINUTE|HOUR|DAY */
            if (!strcmp(optarg,"s"))
            	timer1_config->time_unit = (SECOND);
            else if (!strcmp(optarg,"m"))
            	timer1_config->time_unit = (MINUTE);
            else if (!strcmp(optarg,"h"))
            	timer1_config->time_unit = (HOUR);
			else if (!strcmp(optarg,"d"))
            	timer1_config->time_unit = (DAY);
			else{
				out_len += sprintf(cmd_out+out_len,"time unit error!\n");
            	usage(myName);
            	exit(1);
            }
            break;
        case 'u':   /* power up  duration, defaults to DEFAULT_ON_DURATION  */
            timer1_config->up_time = myAtoi(optarg);
            break;
        case 'd':   /* power off  duration, defaults to DEFAULT_OFF_DURATION */
            strcpy(down_arg, optarg);
            timer1_config->down_time = myAtoi(optarg);
            break;
        case 'c':   /* cycle count, defaults to DEFAULT_CYCLE_COUNT */
            timer1_config->count = myAtoi(optarg);
            break;
        case 't':   /* power type , defaults to DEFAULT_POWER_TYPE */
            if (!strcmp(optarg,"AT"))
            	timer1_config->power_type = POWER_AT;
            else if (!strcmp(optarg,"ATX"))
            	timer1_config->power_type = POWER_ATX;
            else{
            	usage(myName);
            	exit(1);
            }
            break;
        case 'g':   /* cycle count, defaults to DEFAULT_CYCLE_COUNT */
			strcpy(group_arg,optarg);
			has_group = true;
        	if (strtol(optarg,NULL,10) != 1 ){  // index must start from 1
				usage(myName);
				exit(1) ;
			}
            break;

        default:
			out_len += sprintf(cmd_out+out_len,"Option -%c unknown\n", opt);
            exit(1);
        }
	}
	
	timer1_config->magic_number = 0x55aa;
	if(timer1_config->time_unit == DAY){//update RTC in eeprom to PC'c RTC
		*((char*) &(timer1_config->down_time)+1) = (char)strtol(down_arg,&next,10);
		*((char*) &(timer1_config->down_time))   = (char)strtol(next+1,NULL,10);
		SYSTEMTIME st;
		GetLocalTime(&st);
		*(buffer + ADDR_RTC_STORAGE) = (char)st.wMinute;
		*(buffer + ADDR_RTC_STORAGE+1) = (char)st.wHour;
	}
	if (has_group == true){
		timer1_config->groups = parse_timer_groups(timer_groups,group_arg,timer1_config->time_unit);
	}
  

}

#ifdef TEST
int main(int argc, char *argv[])
{
	my_main(argc, argv);	
}
#endif 

/*--------------------------------------------------------------------------------------------------------*/
int my_main(int argc, char *argv[])
{
	usbDevice_t *dev;
	char        buffer[EEPROM_USED_SIZE+1];    /* room for dummy report ID */
	int         err;
	unsigned short* p_count;
	char* myName = argv[0];

    if(argc < 2){
        usage(myName);
    }else
  {
		
    dev = openDevice();
    if(dev == NULL)
        return 0;
    if(strcasecmp(argv[1], "read") == 0){
        int len = sizeof(buffer);
        if((err = usbhidGetReport(dev, 0, buffer, &len)) != 0){
            out_len += sprintf(cmd_out+out_len,"error reading data: %s\n", usbErrorMessage(err));
        }else{
            hexdump(buffer + 1, sizeof(buffer) - 1);
            format_output(buffer + 1, sizeof(buffer) - 1);
//        	system("pause");
        }
    }else  if(strcasecmp(argv[1], "read_count") == 0){
        int len = sizeof(buffer);
        if((err = usbhidGetReport(dev, 0, buffer, &len)) != 0){
            out_len += sprintf(cmd_out+out_len,"error reading data: %s\n", usbErrorMessage(err));
        }else{
        	p_count = (char*)buffer + sizeof(timer_config_t) + 3; //3= 1byte head + 2byte magic_number of RUNNING
       		out_len += sprintf(cmd_out+out_len,"Remaining cycles: %d \n",(unsigned short) *p_count);
        	out_len += sprintf(cmd_out+out_len,"剩余循环: %d \n",(unsigned short) *p_count);
//       	system("pause");
        }
    }else if(strcasecmp(argv[1], "write") == 0){
        int i, pos;
        memset(buffer, 0, sizeof(buffer));
        for(pos = 1, i = 2; i < argc && pos < sizeof(buffer); i++){
            pos += hexread(buffer + pos, argv[i], sizeof(buffer) - pos);
        }
        if((err = usbhidSetReport(dev, buffer, sizeof(buffer))) != 0)   /* add a dummy report ID */
           out_len += sprintf(cmd_out+out_len,"error writing data: %s\n", usbErrorMessage(err));
    }else if(strcasecmp(argv[1], "setup") == 0){
        memset(buffer, 0, sizeof(buffer));
		timer_setup(buffer+1,argc,argv);
        if((err = usbhidSetReport(dev, buffer, sizeof(buffer))) != 0)   /* add a dummy report ID */
           out_len += sprintf(cmd_out+out_len,"error writing data: %s\n", usbErrorMessage(err));
//		system("pause");
    	
    }else{
        usage(argv[0]);
//        system("pause");
//        exit(1);
    }

    usbhidCloseDevice(dev);
	}
	cmd_out[out_len] = '\0'; // end with flag '\0'
#ifdef TEST
    fprintf(stdout,cmd_out);
	system("pause");
#endif
    return 0;

}
