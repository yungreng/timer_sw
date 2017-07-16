#ifndef _TIMER_H_
#define _TIMER_H_

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

enum { DOWN, UP, };

enum { NO, YES, };
enum { OK, ERROR, };


#define MAGIC_INIT 0x55aa
#define MAGIC_NONE_INIT 0x0000
#define RUNNING 0x55aa
#define NOT_RUNNING 0x0000

#define TICKS_PER_SECOND	183
#define SECONDS_PER_MINUTE	60
#define MINUTES_PER_HOUR	60
#define HOURS_PER_DAY		24

#define DEFAULT_UP 1
#define DEFAULT_DOWN 30
#define DEFAULT_UNIT MINUTE
#define DEFAULT_COUNT 65535
#define DEAULT_POWER_TYPE POWER_AT


#ifdef atmega48
#define T2_IRQ_DISABLE()	(TIMSK2 &= ~(1<<TOIE2)); // enabel T2 irq
#define T2_IRQ_ENABLE()	(TIMSK2 |= 1<<TOIE2); // enabel T2 irq
#define T2_IRQ_CLEAR()	(TIFR2  |= 1<<TOV2); //  clear T2 irq
#define T2_SCALER256()	(TCCR2B |= (1<<CS22 | 1<<CS21)); //prescaler setup to 256,
#endif

#ifdef atmega8
#define T2_IRQ_DISABLE()	(TIMSK &= ~(1<<TOIE2)); // enabel T2 irq
#define T2_IRQ_ENABLE()	(TIMSK |= 1<<TOIE2); // enabel T2 irq
#define T2_IRQ_CLEAR()	(TIFR  |= 1<<TOV2); //  clear T2 irq
#define T2_SCALER256()	(TCCR2 |= (1<<CS22 | 1<<CS21)); //prescaler setup to 256,
#endif







/*
   EEPROM STORAGE FORMAT:
   timer_config_t config_timer;
   timer_status_t status_timer;
   timer_group_t imer_groups[]; variable length, defined by config_timer.groups

*/

#define EEPROM_USED_SIZE 128
#define ADDR_CONFIG 0
#define ADDR_STATUS (ADDR_CONFIG+sizeof(timer_config_t))
#define ADDR_GROUP1 (ADDR_STATUS+sizeof(timer_status_t))
#define ADDR_GROUPS (ADDR_GROUP1+sizeof(timer_group_t))
#define ADDR_RTC (EEPROM_USED_SIZE-sizeof(rtc_t))
typedef struct {
    unsigned short magic_number;
    unsigned short up_time;
    unsigned short down_time;
    unsigned short time_unit;
    unsigned short count;
    unsigned char power_type;
    unsigned char groups;
}timer_config_t;

typedef struct {
    unsigned short up_time;
    unsigned short down_time;
}timer_group_t;

typedef struct {
    unsigned char minute;
    unsigned char hour;
}down_time_t;


typedef struct {
    unsigned short run_status;
    unsigned short count1;
    unsigned short count2;
    unsigned short count3;
}timer_status_t;

typedef struct{  //	unsigned char rtc_second, comment out for reducing times of  writing eeprom.
    unsigned char minute;
    unsigned char hour;
    unsigned short day;
    unsigned char msecond;
    unsigned char second;
}rtc_t;


typedef struct {
    timer_config_t timer_config;
    timer_status_t timer_status;
    timer_group_t timer_group1;
    char  stuff[EEPROM_USED_SIZE-sizeof(timer_config_t)-sizeof(timer_status_t)-sizeof(timer_group_t)-sizeof(rtc_t)];
    rtc_t rtc;
}timer_EEPROM_t;

typedef struct {
    timer_config_t config;
    timer_status_t status;
    rtc_t rtc;
    unsigned short count_left;
    unsigned short time_left;
    timer_group_t* timer_groups;
    timer_group_t* current_group;
    timer_group_t* end_group;
    unsigned char  SW_status;
    unsigned char  pin;
}timer_RAM_t;

void timer_init(void);
void serve_tick_msg(void);
//-----------------------------------------------------------------------------------
void serve_second_msg(void);

//----------------------------------------------------------------------------------
void serve_minute_msg(void);

//-----------------------------------------------------------------------------------
void serve_hour_msg(void);



#endif   // _TIMER_H_
