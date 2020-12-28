@echo off
title Time Monitor To Terminate TSDuck




echo '-----------------------------------------------------------'
echo '          time_monitor_to_terminate_TSDuck.bat             '
echo '   This is the script to terminate all tsp.exe timely.     '
echo '                                                           '
echo '   @tcjj3    github.com/tcjj3/himawari-rx_auto_scripts     '
echo '-----------------------------------------------------------'




echo Time Monitor Started...


set lasttime=0
set minutes_mod=0


:start


set dt=%date%

set nowdate=%dt:~0,4%/%dt:~5,2%/%dt:~8,2%


set tt=%time%

set hours=%tt:~0,2%
set hours_1=%tt:~0,1%
if "%hours_1%"==" " (set hours=0%tt:~1,1%)

set minutes=%tt:~3,2%
set minutes_1=%tt:~3,1%
if "%minutes_1%"=="0" (set minutes=%tt:~4,1%)
set /a minutes_mod=%minutes% %% 10
set nowtime=%nowdate%__%hours%:%tt:~3,2%


if not %lasttime%==%nowtime% (
if %minutes_mod%==5 (
echo %nowtime%: Execute "taskkill /f /im tsp.exe"
taskkill /f /im tsp.exe
set lasttime==%nowtime%
)
)


goto start





