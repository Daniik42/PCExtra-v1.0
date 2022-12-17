set version=v1.1

@echo off
color 6
cls
mode con cols=80 lines=50

title PC Extra v1.1 (fix)

:main
cls
echo.
echo     [*] Run as admin, or some of commands, wont work!
echo.
echo.
echo     [1] Reset IP
echo.
echo     [2] Get IP
echo     [3] Get All about IP
echo.
echo     [4] Display DNS
echo     [5] Flush DNS
echo.
echo     [6] Get Mac IP
echo     [7] Connect to Mac
echo     [8] Get DNS IP from Web
echo.
echo     [9] Check for power issues
echo     [10] Check for battery issues
echo     [11] Check for disk issues
echo     [12] Check for disk issues (fyzical sector)+(need reboot after)
echo     [13] Check for system files issues
echo.
echo     [14] Check System image (normal scan)
echo     [15] Check System image (longer, better scan)
echo     [16] Check System image (restore)
echo.
echo     [17] Check for certain script in task manager
echo     [18] taskkill script in task manager (need PID)
echo.
echo     [19] Disable Firewall
echo     [20] Ping web/person (once)
echo     [21] Ping web/person (loop)
echo     [22] Show Open Ports
echo     [23] Show Process PID
echo     [24] Get '' Sit, receive ,, statistics
echo.
echo     [25] Copy to Cliboard
echo     [26] Check for all filetypes
echo     [27] Go to BIOS (reboot needed)
echo.
echo.
echo.
echo     [e] exit
set /p input=Option:


if %input% == 1 goto :resetip
if %input% == 2 goto :getip
if %input% == 3 goto :getallip
if %input% == 4 goto :displaydns
if %input% == 5 goto :flushdns
if %input% == 6 goto :getmacip
if %input% == 7 goto :connecttomac
if %input% == 8 goto :getdnsfromweb
if %input% == 9 goto :checkpower
if %input% == 10 goto :checkbattery
if %input% == 11 goto :checkdisk
if %input% == 12 goto :checkdiskf
if %input% == 13 goto :checksystemfiles
if %input% == 14 goto :systemimage1
if %input% == 15 goto :systemimage2
if %input% == 16 goto :systemimage3
if %input% == 17 goto :checkcertaintmn
if %input% == 18 goto :taskkillintm
if %input% == 19 goto :disablefirewall
if %input% == 20 goto :pingo
if %input% == 21 goto :pingl
if %input% == 22 goto :showopenports
if %input% == 23 goto :showprocessid
if %input% == 24 goto :getsitreceive
if %input% == 25 goto :copytoclip
if %input% == 26 goto :checkforall
if %input% == 27 goto :gotobios
if %input% == e goto :eof

:resetip
ipconfig /release >nul
ipconfig /renew >nul
timeout /t 3 >nul
echo Done!
pause >nul
goto :main

:getip
ipconfig
timeout /t 2 >nul
pause >nul
goto :main

:getallip
ipconfig /all
pause >nul
goto :main


:displaydns
ipconfig /displaydns
pause >nul
echo Done!
:: fix
goto :main
:flushdns
ipconfig /flushdns
pause >nul
goto :main
:getmacip

getmac /v
pause >nul
goto :main
:connecttomac

set /p input=System:
getmac /S %input%
pause >nul
goto :main
:getdnsfromweb

set input=IP/URL
nslookup %input%
pause >nul
goto :main

:checkpower
powercfg /energy
pause >nul
goto :main

:checkbattery
powercfg /batteryreport
pause >nul
goto :main

:checkdisk
chkdsk /f
pause >nul
goto :main

:checkdiskf
chkdsk /r
pause >nul
goto :main

:checksystemfiles
sfc /scannow
pause >nul
goto :main
:systemimage1
DISM /Online /Cleanup-Image /CheckHealth
timeout /t 1 >nul
pause >nul
goto :main

:systemimage2
DISM /Online /Cleanup-Image /ScanHealth
timeout /t 1 >nul
pause >nul
goto :main

:systemimage3
DISM /Online /Cleanup-Image /RestoreHealth
timeout /t 1 >nul
pause >nul
goto :main

:checkcertaintmn
set /p input=Application with (*.):
tasklist | findstr %input%
pause >nul
goto :main

:taskkillintm
set /p input=Application with (*.):
taskkill /f %input%
goto :main

:disablefirewall
netsh advfirewall set allprofiles state off
goto :main

:pingo
set /p input=IP/URL:
ping %input%

:pingl
set /p input=IP/URL:
ping %input% -t

:showopenports
netstat -af
pause >nul
goto :main

:showprocessid
nestat -o
pause >nul
goto :main

:getsitreceive
netstat -e -t 5

:copytoclip
set /p input=Command:
%input% | clip
pause >nul
goto :main

:checkforall
assoc
pause >nul
goto :main

:gotobios
shutdown /r /fw /f /t 0
exit
