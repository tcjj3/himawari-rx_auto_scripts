#!/bin/bash



echo "'-----------------------------------------------------------'"
echo "'                     terminate_TSDuck.sh                   '"
echo "'     This is the script to terminate all tsp process.      '"
echo "'                                                           '"
echo "'   @tcjj3    github.com/tcjj3/himawari-rx_auto_scripts     '"
echo "'-----------------------------------------------------------'"




BASEDIR=$(dirname $0)
cd $BASEDIR


tmp_path="/tmp"
#tmp_path="/dev/shm"






[ -f "$tmp_path/terminate_TSDuck.lock" ] && exit 0
touch "$tmp_path/terminate_TSDuck.lock"






killall -9 tsp > /dev/null






rm "$tmp_path/terminate_TSDuck.lock"







