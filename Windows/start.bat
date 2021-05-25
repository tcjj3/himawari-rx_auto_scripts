@echo off
title himawari-rx_auto_scripts_starter







echo '-----------------------------------------------------------'
echo '                        start.bat                          '
echo '                This is the starter script.                '
echo '                                                           '
echo '   @tcjj3    github.com/tcjj3/himawari-rx_auto_scripts     '
echo '-----------------------------------------------------------'










set device=%1

if defined device (
start /D "%~dp0%" %" himawari-rx__auto.bat %device%
) else (
start /D "%~dp0%" %" himawari-rx__auto.bat
)







start /D "%~dp0%" %" time_monitor_to_terminate_TSDuck.bat







exit






