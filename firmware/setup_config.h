#define MAGIC_INIT 0x55aa
#define MAGIC_NONE_INIT 0x0000
#define RUNNING 0x55aa
#define NOT_RUNNING 0x0000
enum {
	POWER_AT=0x01,
	POWER_ATX=0x02,
};
enum {
	SECOND=0x01,
	MINUTE=0x02,
	HOUR=0x03,
	DAY=0x04,
};


typedef struct timer_config{
	unsigned short magic_number;
	unsigned short up_time;
	unsigned short down_time;
	unsigned short time_unit;
	unsigned short count;
	unsigned char power_type;
	unsigned char groups;
}timer_config_t;

typedef struct timer_status{
	unsigned short status;
	unsigned short count1;
	unsigned short count2;
	unsigned short count3;
}timer_status_t;





