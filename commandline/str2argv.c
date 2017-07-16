

/*
***	version 0.1 , by russot hwang @2013.8.1
*** argc, for return parameter count
***	argv, for return parameter array
***	cmd_buffer, string to be converted into argv
***	cmd_name, dedicated command_name to argv[0], leave null if not available
*/


#ifdef GUI

#ifdef GETOPT
extern int optind;
#endif 
void str2argv(int* argc, char** argv, char* cmd_buffer,char* cmd_name)
{
	char* pHead = cmd_buffer;
	char* pTail = cmd_buffer;
	
	int len = 0;
	*argc = 0;

#ifdef GETOPT
	optind = 0;   // for multi-call getopt from standard libc
#endif 	

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



