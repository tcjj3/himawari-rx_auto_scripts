# himawari-rx_auto_scripts
[![GitHub release](https://img.shields.io/github/release/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/releases/latest)
[![Github all releases](https://img.shields.io/github/downloads/tcjj3/himawari-rx_auto_scripts/total.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/releases/latest)
[![GitHub license](https://img.shields.io/github/license/tcjj3/himawari-rx_auto_scripts.svg)](https://github.com/tcjj3/himawari-rx_auto_scripts/blob/master/LICENSE)

Automatic scripts for [**sam210723/himawari-rx**](https://github.com/sam210723/himawari-rx).

**``himawari-rx__auto.bat``** is the main script for start ``TSDuck`` to record a dump file, then rename the dump file and start ``himawari-rx__decode.bat`` automatic when ``TSDuck`` is terminated, and start ``TSDuck`` again at the same time to record next round.

**``himawari-rx__decode.bat``** is the script for start ``himawari-rx`` to receive files, and make pictures automatic. It will start automatic by the ``himawari-rx__auto.bat`` script.

**``time_monitor_to_terminate_TSDuck.bat``** is the script to terminate **all ``TSDuck processes (tsp.exe)``** automatic **``every 10 minutes``** (when **``the last digit``** of **``minute``** is **``5``**), then will make ``himawari-rx__decode.bat`` started automatic by ``himawari-rx__auto.bat``. <br>
**Notice:** **all ``TSDuck processes (tsp.exe)``** will be **terminated** when it's time to **terminate** **``tsp.exe``** by this script!


Usage: <br>
(1) Be sure the operating system is **``Windows``**, **``TSDuck``** is installed, your hardwares is working and **``himawari-rx``** can work at the same computer. <br>
(2) Then just put these scripts to **``himawari-rx``**'s directory (at the same directory as **``himawari-rx.py``**). <br>
(3) Finally start **``himawari-rx__auto.bat``** and **``time_monitor_to_terminate_TSDuck.bat``** at the same time, they will start to receive and make pictures automatic.
