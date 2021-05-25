#!/bin/bash



echo "'-----------------------------------------------------------'"
echo "'                  himawari-rx__decode.sh                   '"
echo "'This is the decode script (start by main script automatic).'"
echo "'                                                           '"
echo "'   @tcjj3    github.com/tcjj3/himawari-rx_auto_scripts     '"
echo "'-----------------------------------------------------------'"




BASEDIR=$(dirname $0)
cd $BASEDIR


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










python3 himawari-rx.py --config himawari-rx.ini --file "$tmp_path/udp_fordecode.dump" -v




mkdir "$BASEDIR/received/tar" > /dev/null
mkdir "$BASEDIR/received/others" > /dev/null

#for i in ./received/*; do
for i in $BASEDIR/received/*; do
if [ -d "$i" ]; then

mkdir "$i/IMG_DK01B04" > /dev/null
mkdir "$i/IMG_DK01B05" > /dev/null
mkdir "$i/IMG_DK01B06" > /dev/null
mkdir "$i/IMG_DK01B07" > /dev/null
mkdir "$i/IMG_DK01B09" > /dev/null
mkdir "$i/IMG_DK01B10" > /dev/null
mkdir "$i/IMG_DK01B11" > /dev/null
mkdir "$i/IMG_DK01B12" > /dev/null
mkdir "$i/IMG_DK01B14" > /dev/null
mkdir "$i/IMG_DK01B16" > /dev/null
mkdir "$i/IMG_DK01IR1" > /dev/null
mkdir "$i/IMG_DK01IR2" > /dev/null
mkdir "$i/IMG_DK01IR3" > /dev/null
mkdir "$i/IMG_DK01IR4" > /dev/null
mkdir "$i/IMG_DK01VIS" > /dev/null

for j in $i/*; do
if [ -d "$j" ]; then
DirName=`echo $j | awk -F '/' '{print $NF}'`
header4="${DirName: 0: 4}"
if [ "$header4" != "IMG_" ] && [ "$header4" != "SATA" ]; then



if [ ! -f "$j/decoded.txt" ]; then
#if [ ! -f "$j/FC.png" ]; then
python3 ./tools/xrit-img.py -s "$j"
python3 ./tools/false-colour.py "$j"
#fi



#if [ ! -f "$j/FC.png" ]; then
[ ! -f "$i/$DirName.png" ] && mv "$j/FC.png" "$i/$DirName.png" > /dev/null
#fi


for k in $j/IMG_DK01B04_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01B04/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01B04/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01B05_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01B05/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01B05/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01B06_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01B06/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01B06/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01B07_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01B07/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01B07/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01B09_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01B09/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01B09/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01B10_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01B10/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01B10/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01B11_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01B11/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01B11/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01B12_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01B12/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01B12/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01B14_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01B14/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01B14/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01B16_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01B16/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01B16/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01IR1_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01IR1/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01IR1/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01IR2_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01IR2/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01IR2/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01IR3_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01IR3/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01IR3/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01IR4_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01IR4/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01IR4/""$DirName""_""$FileName" > /dev/null
done

for k in $j/IMG_DK01VIS_*.png; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ ! -f "$i""/IMG_DK01VIS/""$DirName""_""$FileName" ] && mv "$k" "$i""/IMG_DK01VIS/""$DirName""_""$FileName" > /dev/null
done


if [ -f "$BASEDIR/himawari-rx__sataid.sh" ]; then
$BASEDIR/himawari-rx__sataid.sh "$i" "$DirName" &
else
if [ ! -f "$BASEDIR/himawari-rx__rmdir.sh" ]; then
touch "$j/decoded.txt"
fi
fi



fi


if [ ! -f "$BASEDIR/himawari-rx__sataid.sh" ]; then
if [ -f "$BASEDIR/himawari-rx__rmdir.sh" ]; then
$BASEDIR/himawari-rx__rmdir.sh "$j" &
[ ! -z "$j" ] && rm -r "$j" > /dev/null &
fi
fi


fi
fi
done



elif [ -f "$i" ]; then
file_ext=`echo "$i" | awk -F '.' '{print $NF}'`
if [ "$file_ext" == "tar" ]; then
mv "$i" "$BASEDIR/received/tar/" > /dev/null
else
mv "$i" "$BASEDIR/received/others/" > /dev/null
fi
fi
done









