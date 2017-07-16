# Name: Makefile
# Project: hid-data example
# Author: Christian Starkjohann
# Creation Date: 2008-04-11
# Tabsize: 4
# Copyright: (c) 2008 by OBJECTIVE DEVELOPMENT Software GmbH
# License: GNU GPL v2 (see License.txt), GNU GPL v3 or proprietary (CommercialLicense.txt)

# Please read the definitions below and edit them as appropriate for your
# system:

# Use the following 3 lines on Unix and Mac OS X:
#USBFLAGS=   `libusb-config --cflags`
#USBLIBS=    `libusb-config --libs`
#EXE_SUFFIX=

# Use the following 3 lines on Windows and comment out the 3 above:
USBFLAGS=
#USBLIBS=    -lhid -lusb -lsetupapi
USBLIBS=    -lhid  -lsetupapi --static
EXE_SUFFIX= .exe

CC=				avr-gcc
CFLAGS=			-O -Wall $(USBFLAGS) -DTEST
LIBS=			$(USBLIBS)

OBJ=		hidtool.o hiddata.o
OBJ-TIMER=  timer-tool.o hiddata.o
OBJ-TIMER-WEB= webserver.o
PROGRAM=	hidtool$(EXE_SUFFIX)
TIMER= timer-tool$(EXE_SUFFIX)
TIMER-WEB= timer-web$(EXE_SUFFIX)

all: $(PROGRAM) $(TIMER) $(TIMER-WEB)  strip

$(TIMER): $(OBJ-TIMER)
	$(CC) -o $(TIMER) $(OBJ-TIMER) $(LIBS) 

$(TIMER-WEB): $(OBJ-TIMER-WEB)
	$(CC) -o $(TIMER-WEB) $(OBJ-TIMER-WEB) -lwsock32  --static

$(PROGRAM): $(OBJ)
	$(CC) -o $(PROGRAM) $(OBJ) $(LIBS) 

strip: $(PROGRAM)
	strip $(PROGRAM)
	strip $(TIMER)
	strip $(TIMER-WEB)

clean:
	rm -f $(OBJ) $(PROGRAM)
	rm -f $(OBJ-TIMER) $(TIMER)
	rm -f $(OBJ-TIMER-WEB) $(TIMER-WEB)


.c.o:
	$(CC) $(ARCH_COMPILE) $(CFLAGS) -c $*.c -o $*.o
