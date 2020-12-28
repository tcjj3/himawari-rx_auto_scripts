@echo off

setlocal enabledelayedexpansion

title himawari-rx_decode




echo '-----------------------------------------------------------'
echo '                  himawari-rx__decode.bat                  '
echo 'This is the decode script (start by main script automatic).'
echo '                                                           '
echo '   @tcjj3    github.com/tcjj3/himawari-rx_auto_scripts     '
echo '-----------------------------------------------------------'





python himawari-rx.py --config himawari-rx.ini --file "..\scripts\udp_fordecode.dump" -v






for /d %%i in (received\*) do (

mkdir %%i\IMG_DK01B04 >nul
mkdir %%i\IMG_DK01B05 >nul
mkdir %%i\IMG_DK01B06 >nul
mkdir %%i\IMG_DK01B07 >nul
mkdir %%i\IMG_DK01B09 >nul
mkdir %%i\IMG_DK01B10 >nul
mkdir %%i\IMG_DK01B11 >nul
mkdir %%i\IMG_DK01B12 >nul
mkdir %%i\IMG_DK01B14 >nul
mkdir %%i\IMG_DK01B16 >nul
mkdir %%i\IMG_DK01IR1 >nul
mkdir %%i\IMG_DK01IR2 >nul
mkdir %%i\IMG_DK01IR3 >nul
mkdir %%i\IMG_DK01IR4 >nul
mkdir %%i\IMG_DK01VIS >nul

REM for /d %%j in (%%i\*) do (
for /f "delims=" %%j in ('dir /A:D /b %%i\*') do (

set t=%%j
set tt=!t:~0,4!

if not !tt!==IMG_ (
if not exist %%i\%%j\decoded.txt (

REM if not exist %%i\%%j\FC.png (
.\tools\xrit-img.py -s %%i\%%j
.\tools\false-colour.py %%i\%%j
REM )

if exist %%i\%%j\FC.png (
if not exist %%i\%%j.png (move %%i\%%j\FC.png %%i\%%j.png >nul)
)

for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01B04_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01B04\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01B05_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01B05\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01B06_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01B06\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01B07_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01B07\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01B09_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01B09\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01B10_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01B10\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01B11_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01B11\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01B12_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01B12\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01B14_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01B14\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01B16_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01B16\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01IR1_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01IR1\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01IR2_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01IR2\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01IR3_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01IR3\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01IR4_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01IR4\%%j_%%k >nul)
)
for /f "delims=" %%k in ('dir /b %%i\%%j\IMG_DK01VIS_*.png') do (
if not exist %%j_%%k (move %%i\%%j\%%k %%i\IMG_DK01VIS\%%j_%%k >nul)
)

copy /y NUL %%i\%%j\decoded.txt >NUL

)
)


)

)






exit




