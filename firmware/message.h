#ifndef _MESSAGE_H_
#define _MESSAGE_H_

#ifdef _STORAGE
#define EXTERN extern
#else
#define EXTERN
#endif
EXTERN unsigned char gMessage;

#define MSG_TICK   0x1<<1
#define MSG_SECOND 0x1<<2
#define MSG_MINUTE 0x1<<3
#define MSG_HOUR   0x1<<4

#define NO_MSG()  gMessage == 0
#define HAS_TICK_MSG()  gMessage & MSG_TICK
#define HAS_SECOND_MSG() gMessage & MSG_SECOND
#define HAS_MINUTE_MSG() gMessage & MSG_MINUTE
#define HAS_HOUR_MSG()   gMessage & MSG_HOUR

#define CLEAR_SIG_TICK()  gMessage &= ~MSG_TICK
#define CLEAR_SIG_SECOND() gMessage &= ~MSG_SECOND
#define CLEAR_SIG_MINUTE() gMessage &= ~MSG_MINUTE
#define CLEAR_SIG_HOUR()   gMessage &= ~MSG_HOUR

#define SIG_TICK()  gMessage |= MSG_TICK
#define SIG_SECOND() gMessage |= MSG_SECOND
#define SIG_MINUTE() gMessage |= MSG_MINUTE
#define SIG_HOUR()   gMessage |= MSG_HOUR

#endif /* _MESSAGE_H_ */


