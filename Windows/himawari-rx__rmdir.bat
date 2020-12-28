@echo off
title himawari-rx_rmdir




echo '-----------------------------------------------------------'
echo '                  himawari-rx__rmdir.bat                   '
echo 'This is the rmdir script (start by decode script automatic)'
echo '                                                           '
echo '         Notice: This script can't run directly,           '
echo '    to avoid it remove this directory and its all files!   '
echo '                                                           '
echo '   @tcjj3    github.com/tcjj3/himawari-rx_auto_scripts     '
echo '-----------------------------------------------------------'





set str=

set str=%1

if not defined str (
echo Dangerous!! This script can't run directly, to avoid it remove this directory and its all files!!
echo Press any key to exit this script...
pause
exit
) else (
echo Remove: %1
)


rmdir /S /Q %1



exit




