#!/bin/bash



echo "'-----------------------------------------------------------'"
echo "'                         start.sh                          '"
echo "'                This is the starter script.                '"
echo "'                                                           '"
echo "'   @tcjj3    github.com/tcjj3/himawari-rx_auto_scripts     '"
echo "'-----------------------------------------------------------'"




BASEDIR=$(dirname $0)


tmp_path="/tmp"
#tmp_path="/dev/shm"











# grep "\\\\" $BASEDIR/file.py
tmp=`grep "\\\\\\\\" $BASEDIR/file.py`
if [ ! -z "$tmp" ]; then
cp $BASEDIR/file.py $BASEDIR/file.bak.py
sed -i "s#\\\\\\\\#/#gi" $BASEDIR/file.py
echo "Patched File Path Splitter in file.py !"
fi


# grep "\\\\" $BASEDIR/tools/xrit-img.py
tmp=`grep "\\\\\\\\" $BASEDIR/tools/xrit-img.py`
if [ ! -z "$tmp" ]; then
cp $BASEDIR/tools/xrit-img.py $BASEDIR/tools/xrit-img.bak.py
sed -i "s#\\\\\\\\#/#gi" $BASEDIR/tools/xrit-img.py
echo "Patched File Path Splitter in /tools/xrit-img.py !"
fi


# grep "\\\\" $BASEDIR/tools/false-colour.py
tmp=`grep "\\\\\\\\" $BASEDIR/tools/false-colour.py`
if [ ! -z "$tmp" ]; then
cp $BASEDIR/tools/false-colour.py $BASEDIR/tools/false-colour.bak.py
sed -i "s#\\\\\\\\#/#gi" $BASEDIR/tools/false-colour.py
echo "Patched File Path Splitter in /tools/false-colour.py !"
fi










nohup $BASEDIR/himawari-rx__auto.sh &










# crontab doesn't work on some version of Linux,
# so give up this way and replace with another way:
#
#
#crontab_path="$tmp_path/crontab_himawari_rx"
#crontab_cmd="5,15,25,35,45,55 * * * * $BASEDIR/terminate_TSDuck.sh &"
#
#crontab_contents=`grep "$crontab_cmd" "$crontab_path"`
#[ -z "$crontab_contents" ] && echo "$crontab_cmd" > "$crontab_path"
#
#crontab_ps=`ps -A -f | grep -v "grep" | grep "crontab" | grep "$crontab_path"`
#[ -z "$crontab_ps" ] && crontab "$crontab_path" &



nohup $BASEDIR/time_monitor_to_terminate_TSDuck.sh &











