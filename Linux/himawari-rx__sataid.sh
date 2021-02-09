#!/bin/bash



echo "'-----------------------------------------------------------'"
echo "'                  himawari-rx__sataid.sh                   '"
echo "'This is the sataid script(start by decode script automatic)'"
echo "'                                                           '"
echo "'   @tcjj3    github.com/tcjj3/himawari-rx_auto_scripts     '"
echo "'-----------------------------------------------------------'"




BASEDIR=$(dirname $0)


tmp_path="/tmp"
#tmp_path="/dev/shm"




Proc_File() {
BASEDIR=$(dirname $0)

DirPath="$1/$2"
FileName="$3"
FileName="${FileName: 0: 24}"
FilePath="$DirPath/$FileName"

wine $BASEDIR/hrit2sataid/hritconcat.exe -d1="$FilePath"_001 -d2="$FilePath"_002 -d3="$FilePath"_003 -d4="$FilePath"_004 -d5="$FilePath"_005 -d6="$FilePath"_006 -d7="$FilePath"_007 -d8="$FilePath"_008 -d9="$FilePath"_009 -d10="$FilePath"_010 -o=$FilePath.hrit -p > /dev/null
wine $BASEDIR/hrit2sataid/hrit2sataid.exe -z $FilePath.hrit $FilePath.Z$2 $BASEDIR/hrit2sataid/hrit2sataid_FullDisk.ini > /dev/null
mv $FilePath.Z$2 $1/SATAID/$FileName.Z$2 > /dev/null
}




folder_path="$1"
DirName="$2"

DirPath="$folder_path/$DirName"

if [ -z "$folder_path" ]; then
echo "This script can't run directly!"
echo "Exit..."
exit 0
fi



mkdir "$folder_path/SATAID" > /dev/null



firstLine=1
for k in $DirPath/IMG_DK01B04_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01B05_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01B06_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01B07_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01B09_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01B10_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01B11_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01B12_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01B14_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01B16_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01IR1_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01IR2_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01IR3_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01IR4_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done

firstLine=1
for k in $DirPath/IMG_DK01VIS_*; do
FileName=`echo $k | awk -F '/' '{print $NF}'`
[ "$firstLine" == "1" ] && Proc_File "$folder_path" "$DirName" "$FileName"
firstLine=0
done








if [ -f "$BASEDIR/himawari-rx__rmdir.sh" ]; then
$BASEDIR/himawari-rx__rmdir.sh "$DirPath" &
[ ! -z "$DirPath" ] && rm -r "$DirPath" > /dev/null &
else
touch "$DirPath/decoded.txt"
fi





