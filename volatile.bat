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
set "baseFileName=liveIR-%formatted_date%"
set "outputFile=%baseFileName%.txt"
set "counter=1"

REM Check if the file already exists and append a sequential number if necessary
while exist "%outputFile%" (
    set "outputFile=%baseFileName%_%counter%.txt"
    set /a "counter+=1"
)

echo %date% %time% > "%outputFile%"
echo General system information: >> "%outputFile%"
systeminfo >> "%outputFile%"
echo Running Tasks: >> "%outputFile%"
tasklist >> "%outputFile%"
echo Running Tasks m >> "%outputFile%"
tasklist /m >> "%outputFile%"
echo Running tasks svc >> "%outputFile%"
tasklist /svc >> "%outputFile%"
echo Available network connections >> "%outputFile%"
netstat -nao >> "%outputFile%"
echo MAC Addresses in ARP Cache >> "%outputFile%"
arp -a >> "%outputFile%"
echo Network configuration >> "%outputFile%"
ipconfig /all >> "%outputFile%"
echo DNS >> "%outputFile%"
ipconfig /displaydns >> "%outputFile%"
echo Routing Configurations >> "%outputFile%"
route print >> "%outputFile%"
echo System Variables >> "%outputFile%"
set >> "%outputFile%"
echo User Information >> "%outputFile%"
net user %username% >> "%outputFile%"
net use >> "%outputFile%"
echo Network Shares >> "%outputFile%"
net share >> "%outputFile%"
echo General Workstation Information >> "%outputFile%"

echo Script execution completed. Output saved to "%outputFile%".
