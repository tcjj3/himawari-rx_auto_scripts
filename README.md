# himawari-rx_auto_scripts
Automatic scripts for [**sam210723/himawari-rx**](https://github.com/sam210723/himawari-rx).

**himawari-rx__auto.bat** is the main script for start TSDuck to record a dump file, then rename the dump file and start **himawari-rx__decode.bat** automatic when TSDuck is terminated, and start TSDuck again at the same time to record next round.

**himawari-rx__decode.bat** is the script for start himawari-rx to receive files, and make pictures automatic. It will start automatic by the **himawari-rx__auto.bat** script.

**time_monitor_to_terminate_TSDuck.bat** is the script to terminate **all TSDuck processes (tsp.exe)** automatic **every 10 minutes** (when **the last digit** of **minute** is **5**), then will make **himawari-rx__decode.bat** started automatic by **himawari-rx__auto.bat**. <br>
**Notice:** **all TSDuck processes (tsp.exe)** will be **terminated** when it's time to **terminate** **tsp.exe** by this script!


Usage: Be sure the operating system is Windows, TSDuck is installed, your hardwares is working and himawari-rx can work on the same computer, then just put these scripts to **himawari-rx**'s directory, and start **himawari-rx__auto.bat** and **time_monitor_to_terminate_TSDuck.bat**, it will start to receive and make the pictures automatic.
