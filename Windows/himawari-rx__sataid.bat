@echo off

setlocal enabledelayedexpansion

title himawari-rx_sataid




echo '-----------------------------------------------------------'
echo '                 himawari-rx__sataid.bat                   '
echo 'This is the sataid script(start by decode script automatic)'
echo '                                                           '
echo '   @tcjj3    github.com/tcjj3/himawari-rx_auto_scripts     '
echo '-----------------------------------------------------------'





set str=

set str=%1

if not defined str (
echo This script can't run directly!
echo Press any key to exit this script...
pause
exit
) else (
title himawari-rx_sataid - Files Dir: %1\%2
echo Files Dir: %1\%2
)



mkdir %1\SATAID >nul



Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01B04_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01B05_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01B06_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01B07_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01B09_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01B10_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01B11_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01B12_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01B14_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01B16_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01IR1_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01IR2_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01IR3_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01IR4_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)
Set firstLine=1
for /f "delims=" %%k in ('dir /b %1\%2\IMG_DK01VIS_*') do (
if !firstLine!==1 call :Proc_File %1 %2 %%k
Set firstLine=0
)




if not exist himawari-rx__rmdir.bat (
copy /y NUL %1\%2\decoded.txt >NUL
) else (
start himawari-rx__rmdir.bat %1\%2
)




exit

















:Proc_File
Set "fn=%3"
for %%a in ("%fn%") do set "FileName=%%~na"
Set "FileName=%FileName:~0,24%"
Set "FilePath=%1\%2\%FileName%"

hrit2sataid\hritconcat.exe -d1=%FilePath%_001 -d2=%FilePath%_002 -d3=%FilePath%_003 -d4=%FilePath%_004 -d5=%FilePath%_005 -d6=%FilePath%_006 -d7=%FilePath%_007 -d8=%FilePath%_008 -d9=%FilePath%_009 -d10=%FilePath%_010 -o=%FilePath%.hrit -p
hrit2sataid\hrit2sataid.exe -z %FilePath%.hrit %FilePath%.Z%2 hrit2sataid\hrit2sataid_FullDisk.ini
move %FilePath%.Z%2 %1\SATAID\%FileName%.Z%2 >nul

goto :EOF









