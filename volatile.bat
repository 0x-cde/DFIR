@echo off
setlocal enabledelayedexpansion

REM Get the current date in the format DDMMYYYY
for /f "tokens=1-3 delims=/" %%a in ('echo %date%') do (
    set "day=%%a"
    set "month=%%b"
    set "year=%%c"
)

REM Format day and month to have leading zeros if necessary
if 1%day% lss 100 set day=0%day%
if 1%month% lss 100 set month=0%month%

set "formatted_date=%day%%month%%year%"

REM Create the output file with the formatted date
echo %date% %time% > liveIR-%formatted_date%.txt
echo General system information: >> liveIR-%formatted_date%.txt
systeminfo >> liveIR-%formatted_date%.txt
echo Running Tasks: >> liveIR-%formatted_date%.txt
tasklist >> liveIR-%formatted_date%.txt
echo Running Tasks m >> liveIR-%formatted_date%.txt
tasklist /m >> liveIR-%formatted_date%.txt
echo Running tasks svc >> liveIR-%formatted_date%.txt
tasklist /svc >> liveIR-%formatted_date%.txt
echo Available network connections >> liveIR-%formatted_date%.txt
netstat -nao >> liveIR-%formatted_date%.txt
echo MAC Addresses in ARP Cache >> liveIR-%formatted_date%.txt
arp -a >> liveIR-%formatted_date%.txt
echo Network configuration >> liveIR-%formatted_date%.txt
ipconfig /all >> liveIR-%formatted_date%.txt
echo DNS >> liveIR-%formatted_date%.txt
ipconfig /displaydns >> liveIR-%formatted_date%.txt
echo Routing Configurations >> liveIR-%formatted_date%.txt
route print >> liveIR-%formatted_date%.txt
echo System Variables >> liveIR-%formatted_date%.txt
set >> liveIR-%formatted_date%.txt
echo User Information >> liveIR-%formatted_date%.txt
net user %username% >> liveIR-%formatted_date%.txt
net use >> liveIR-%formatted_date%.txt
echo Network Shares >> liveIR-%formatted_date%.txt
net share >> liveIR-%formatted_date%.txt
echo General Workstation Information >> liveIR-%formatted_date%.txt
net config workstation >> liveIR-%formatted_date%.txt

echo Script execution completed.