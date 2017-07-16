echo off
rem usage: timer-tool.exe [options]
rem options:
rem         -U s|m|h, time unit s:second,m:minute,h:hour
rem         -u nnn, power up   duration, Max. 65535
rem         -d nnn, power down duration, Max. 65535
rem         -c nnn, cycling times, Max. 65535
rem         -t AT|ATX, power supply type, AT or ATX
rem this utility relies on hidtool.exe


rem uncomment following to work in ATX mode
rem timer-tool.exe -tATX -Us -u30 -d30 -c100 

rem work in AT mode, power down 20s, power up 30s, cycling 100 times
timer-tool.exe setup -tAT -Ud -d21:22  -u3 -c100 