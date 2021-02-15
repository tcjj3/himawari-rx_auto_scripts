#!/bin/bash



echo "'-----------------------------------------------------------'"
echo "'                   himawari-rx__auto.sh                    '"
echo "'                  This is the main script.                 '"
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










# For TBS5520SE Device [ adapter 0 frontend 1, is for DVB-S2 ]:
if [ -d /dev/dvb/adapter0 ]; then
if [ -d /dev/dvb/adapter0/dvr0 ] && [ ! -d /dev/dvb/adapter0/dvr1 ]; then
ln -s dvr0 /dev/dvb/adapter0/dvr1
fi

if [ -d /dev/dvb/adapter0/demux0 ] && [ ! -d /dev/dvb/adapter0/demux1 ]; then
ln -s demux0 /dev/dvb/adapter0/demux1
fi

if [ -d /dev/dvb/adapter0/net0 ] && [ ! -d /dev/dvb/adapter0/net1 ]; then
ln -s net0 /dev/dvb/adapter0/net1
fi
fi







while [ true ]; do

isSuccess=0

while [ $isSuccess == 0 ]; do


#tsp -I dvb --adapter 0 --delivery-system "DVB-S2" --lnb "5150000000" --frequency 4148000000 --modulation QPSK --symbol-rate 2586148 --fec-inner "3/5" --roll-off 0.2 --polarity "horizontal" -P mpe --pid 0x03E9 --log --output-file "$tmp_path/udp.dump" -O drop

# For TBS5520SE Device [ adapter 0 frontend 1, is for DVB-S2 ]:
tsp -I dvb -d /dev/dvb/adapter0:1 --delivery-system "DVB-S2" --lnb "1002" --modulation QPSK --symbol-rate 2586148 --fec-inner "3/5" --roll-off 0.2 --polarity "horizontal" -P mpe --pid 0x03E9 --log --output-file "$tmp_path/udp.dump" -O drop



if [ -s "$tmp_path/udp.dump" ]; then
isSuccess=1
echo "Receive success, now start to decoding..."
else
# * Error: dvb: deliver system DVB-S2 not supported on tuner Mirics BDA Filter
echo "Receiver has error, would retry after 5 seconds..."
sleep 5
fi

if [ -f "$tmp_path/exit_himawari_rx.txt" ]; then
echo "Force exiting..."
exit 0
fi
done






mv "$tmp_path/udp.dump" "$tmp_path/udp_fordecode.dump"

[ -f "$BASEDIR/himawari-rx__decode.sh" ] && $BASEDIR/himawari-rx__decode.sh &







if [ -f "$tmp_path/exit_himawari_rx.txt" ]; then
echo "Force exiting..."
exit 0
fi



done







