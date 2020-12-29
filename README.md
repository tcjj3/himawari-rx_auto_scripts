# himawari-rx_auto_scripts

[![GitHub commit activity](https://img.shields.io/github/commit-activity/y/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/commits/main)
[![GitHub last commit](https://img.shields.io/github/last-commit/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/commits/main)
[![GitHub commits since latest release](https://img.shields.io/github/commits-since/tcjj3/himawari-rx_auto_scripts/latest.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/commits/main)
[![GitHub Release Date](https://img.shields.io/github/release-date/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/releases/latest)
[![GitHub release](https://img.shields.io/github/release/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/releases/latest)
[![Github all releases](https://img.shields.io/github/downloads/tcjj3/himawari-rx_auto_scripts/total.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/releases/latest)
[![GitHub license](https://img.shields.io/github/license/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/blob/master/LICENSE)

Automatic scripts for [**sam210723/himawari-rx**](https://github.com/sam210723/himawari-rx).

**``himawari-rx__auto.bat``** is the main script for start ``TSDuck`` to record a dump file, then rename the dump file and start ``himawari-rx__decode.bat`` automatic when ``TSDuck`` is terminated, and start ``TSDuck`` again at the same time to record next round.

**``himawari-rx__decode.bat``** is the script for start ``himawari-rx`` to receive files, and make pictures automatic. It will start automatic by the ``himawari-rx__auto.bat`` script.

**``himawari-rx__rmdir.bat``** is the script for **remove ``the directories of hrit files``** after **all ``pictures`` are made** (functional like **``clear cache``**). <br>
**Warnning: This script mustn't run directly, to avoid it remove current directory and its all files!** <br>
**Note:** If you **don't want** to "**remove ``the directories of hrit files``** after **all ``pictures`` are made**", just remove the script **``himawari-rx__rmdir.bat``** from **``himawari-rx``**'s directory (at the same directory as **``himawari-rx.py``**), then this feature will be disabled.

**``time_monitor_to_terminate_TSDuck.bat``** is the script to terminate **all ``TSDuck processes (tsp.exe)``** automatic **``every 10 minutes``** (when **``the last digit``** of **``minute``** is **``5``**), then will make ``himawari-rx__decode.bat`` started automatic by ``himawari-rx__auto.bat``. <br>
**Notice:** **all ``TSDuck processes (tsp.exe)``** will be **terminated** when it's time to **terminate** **``tsp.exe``** by this script!


Usage: <br>
(1) Be sure the operating system is **``Windows``**, **``TSDuck``** is installed, your hardwares is working and **``himawari-rx``** can work at the same computer. <br>
(2) Then put these scripts to **``himawari-rx``**'s directory (at the same directory as **``himawari-rx.py``**). <br>
(3) Finally just start **``start.vbs``**, it will automatic start ``himawari-rx__auto.bat`` and ``time_monitor_to_terminate_TSDuck.bat`` at the same time, they will start to receive and make pictures automatic.
