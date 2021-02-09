#!/bin/bash



echo "'-----------------------------------------------------------'"
echo "'           time_monitor_to_terminate_TSDuck.sh             '"
echo "'  This is the script to terminate all tsp process timely.  '"
echo "'                                                           '"
echo "'   @tcjj3    github.com/tcjj3/himawari-rx_auto_scripts     '"
echo "'-----------------------------------------------------------'"




BASEDIR=$(dirname $0)


tmp_path="/tmp"
#tmp_path="/dev/shm"






lasttime=""
minutes_mod=0






echo "Time Monitor Started..."






while [ true ]; do



#nowtime=`date "+%Y-%m-%d %H:%M:%S.%s"`
nowtime=`date "+%Y-%m-%d %H:%M:%S"`
minutes=`echo "$nowtime" | awk -F ':' '{print $2}'`

minutes_mod=`expr $minutes % 10`

if [ "$lasttime" != "$nowtime" ]; then
if [ "$minutes_mod" == "5" ]; then
echo "$nowtime: Execute \"killall -9 tsp\""
killall -9 tsp > /dev/null
lasttime="$nowtime"
fi
fi



sleep 10



if [ -f "$tmp_path/exit_himawari_rx.txt" ]; then
echo "Force exiting..."
exit 0
fi



done







