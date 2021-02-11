# himawari-rx_auto_scripts

[![GitHub commit activity](https://img.shields.io/github/commit-activity/y/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/commits/main)
[![GitHub last commit](https://img.shields.io/github/last-commit/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/commits/main)
[![GitHub commits since latest release](https://img.shields.io/github/commits-since/tcjj3/himawari-rx_auto_scripts/latest.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/commits/main)
[![GitHub Release Date](https://img.shields.io/github/release-date/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/releases/latest)
[![GitHub release](https://img.shields.io/github/release/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/releases/latest)
[![Github all releases](https://img.shields.io/github/downloads/tcjj3/himawari-rx_auto_scripts/total.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/releases/latest)
[![GitHub license](https://img.shields.io/github/license/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/blob/master/LICENSE)

Automatic scripts for [**sam210723/himawari-rx**](https://github.com/sam210723/himawari-rx).


## System support
There are two verions of systems supported: [**Windows**](#for-windows) and [**Linux**](#for-linux). <br>
The scripts for [**Windows**](#for-windows) are included in [**Windows**](Windows) folder, and for [**Linux**](#for-linux) are in [**Linux**](Linux) folder.


## For Windows

**``himawari-rx__auto.bat``** is the main script for start ``TSDuck`` to record a dump file, then rename the dump file and start ``himawari-rx__decode.bat`` automatic when ``TSDuck`` is terminated, and start ``TSDuck`` again at the same time to record next round.

**``himawari-rx__decode.bat``** is the script for start ``himawari-rx`` to receive files, and make pictures automatic. It will start automatic by the ``himawari-rx__auto.bat`` script.

**``himawari-rx__sataid.bat``** is the script for ``convert`` all received [**``HRIT Data (HRIT File Format)``**](https://www.data.jma.go.jp/mscweb/en/himawari89/space_segment/sample_hrit.html) to [**``SATAID Data (SATAID Format)``**](https://www.data.jma.go.jp/mscweb/en/himawari89/space_segment/sample_sataid.html) (It will start automatic by the ``himawari-rx__decode.bat`` script), then you can ``Register`` the ``SATAID Files`` to ``SATAID`` software. <br>
Here is the download link of **``HimawariCast_software.zip``** (which **``SATAID``** is included in): [**https://www.data.jma.go.jp/mscweb/en/himawari89/himawari_cast/software/HimawariCast_software.zip**](https://www.data.jma.go.jp/mscweb/en/himawari89/himawari_cast/software/HimawariCast_software.zip). <br>
**Note:** If you **don't want** to ``convert`` all received [**``HRIT Data (HRIT File Format)``**](https://www.data.jma.go.jp/mscweb/en/himawari89/space_segment/sample_hrit.html) to [**``SATAID Data (SATAID Format)``**](https://www.data.jma.go.jp/mscweb/en/himawari89/space_segment/sample_sataid.html) automatic, just remove the script **``himawari-rx__sataid.bat``** from **``himawari-rx``**'s directory (at the same directory as **``himawari-rx.py``**), then this feature will be disabled.

The **``hrit2sataid``** folder is the directory of the programs for ``convert`` all received [**``HRIT Data (HRIT File Format)``**](https://www.data.jma.go.jp/mscweb/en/himawari89/space_segment/sample_hrit.html) to [**``SATAID Data (SATAID Format)``**](https://www.data.jma.go.jp/mscweb/en/himawari89/space_segment/sample_sataid.html), which are relied on by the **``himawari-rx__sataid.bat``** script. <br>
The files of the ``hrit2sataid`` folder are extracted from [**``HimawariCast_software.zip (https://www.data.jma.go.jp/mscweb/en/himawari89/himawari_cast/software/HimawariCast_software.zip)``**](https://www.data.jma.go.jp/mscweb/en/himawari89/himawari_cast/software/HimawariCast_software.zip). <br>
**Warnning:** **``Do not``** **remove** this directory or any file of it when you are using the **``himawari-rx__sataid.bat``** script, or the **``himawari-rx__sataid.bat``** script can't work well.

**``himawari-rx__rmdir.bat``** is the script for **remove ``the directories of hrit files``** after **all ``pictures`` are made** (functional like **``clear cache``**). <br>
**Warnning: This script mustn't run directly, to avoid it remove current directory and its all files!** <br>
**Note:** If you **don't want** to "**remove ``the directories of hrit files``** after **all ``pictures`` are made**", just remove the script **``himawari-rx__rmdir.bat``** from **``himawari-rx``**'s directory (at the same directory as **``himawari-rx.py``**), then this feature will be disabled.

**``time_monitor_to_terminate_TSDuck.bat``** is the script to terminate **all ``TSDuck processes (tsp.exe)``** automatic **``every 10 minutes``** (when **``the last digit``** of **``minute``** is **``5``**), then will make ``himawari-rx__decode.bat`` started automatic by ``himawari-rx__auto.bat``. <br>
**Notice:** **all ``TSDuck processes (tsp.exe)``** will be **terminated** when it's time to **terminate** **``tsp.exe``** by this script!

**``start.vbs``** and **``start.bat``** are the **one-click script** of these scripts, you can using **``start.bat``** instead of ``start.vbs`` to get start if ``vbscript`` on your system is **not allowed**.

**Usage**: <br>
(1) Be sure the operating system is **``Windows``**, **``TSDuck``** is installed, your hardwares is working and **``himawari-rx``** can work at the same machine. <br>
(2) Then put the scripts of [**Windows version**](Windows) to **``himawari-rx``**'s directory (at the same directory as **``himawari-rx.py``**). <br>
(3) Finally just start **``start.vbs``** or **``start.bat (if vbscript on your system is not allowed)``**, it will automatic start ``himawari-rx__auto.bat`` and ``time_monitor_to_terminate_TSDuck.bat`` at the same time, they will start to receive and make pictures automatic.



## For Linux

**``himawari-rx__auto.sh``** is functional like **``himawari-rx__auto.bat``**.

**``himawari-rx__decode.sh``** is functional like **``himawari-rx__decode.bat``**.

**``himawari-rx__sataid.sh``** is functional like **``himawari-rx__sataid.bat``**.

The **``hrit2sataid``** folder is the same as the **``hrit2sataid``** folder in **Windows** version.

**``himawari-rx__rmdir.sh``** is functional like **``himawari-rx__rmdir.bat``**, and the remove commands is included in other scripts but not this script (just for mark to **remove ``the directories of hrit files``**).

**``time_monitor_to_terminate_TSDuck.sh``** is functional like **``time_monitor_to_terminate_TSDuck.bat``**.

**``start.sh``** is functional like **``start.bat``**.

**Usage**: <br>
(1) Be sure the operating system is **``Linux``**, **``TSDuck``** and **``wine``** installed (if you **don't want** to ``convert`` all received [**``HRIT Data (HRIT File Format)``**](https://www.data.jma.go.jp/mscweb/en/himawari89/space_segment/sample_hrit.html) to [**``SATAID Data (SATAID Format)``**](https://www.data.jma.go.jp/mscweb/en/himawari89/space_segment/sample_sataid.html) automatic, **``wine``** is not requried), your hardwares is working and **``himawari-rx``** can work at the same machine. <br>
(2) Then put the scripts of [**Linux version**](Linux) to **``himawari-rx``**'s directory (at the same directory as **``himawari-rx.py``**). <br>
(3) Finally just start **``start.sh``**, it will automatic start ``himawari-rx__auto.sh`` and ``time_monitor_to_terminate_TSDuck.sh`` at the same time, they will start to receive and make pictures automatic.

