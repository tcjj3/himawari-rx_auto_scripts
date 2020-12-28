@echo off
title himawari-rx_auto



echo '-----------------------------------------------------------'
echo '                  himawari-rx__auto.bat                    '
echo '                  This is the main script.                 '
echo '                                                           '
echo '   @tcjj3    github.com/tcjj3/himawari-rx_auto_scripts     '
echo '-----------------------------------------------------------'



:start


:receive
tsp -I dvb --adapter 0 --delivery-system "DVB-S2" --lnb "5150000000" --frequency 4148000000 --modulation QPSK --symbol-rate 2586148 --fec-inner "3/5" --roll-off 0.2 --polarity "horizontal" -P mpe --pid 0x03E9 --log --output-file "..\scripts\udp.dump" -O drop

REM if %errorlevel%==1 (
set size=0
for /r %%x in (..\scripts\udp.dump) do set /a size+=%%~zx
if %size%==0 (
REM * Error: dvb: deliver system DVB-S2 not supported on tuner Mirics BDA Filter
echo Receiver has error, would retry after 5 seconds...
choice /t 5 /d y /n >nul
goto receive
) else (
echo Receive success, now start to decoding...
)




move "..\scripts\udp.dump" "..\scripts\udp_fordecode.dump"
start himawari-rx__decode.bat



goto start




