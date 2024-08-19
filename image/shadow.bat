@echo off 
setlocal enabledelayedexpansion

:: Get computer details
set "computerName=%COMPUTERNAME%"
set "username=%USERNAME%"
set "os=%OS%"
set "osVersion="
set "currentDate=%date%"
set "currentTime=%time%"

:: Get OS version using ver command
for /f "tokens=*" %%v in ('ver') do set "osVersion=%%v"


:: Get RAM details using PowerShell
for /f "delims=" %%m in ('powershell "(Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory / 1GB"') do set "ram=%%m GB"

:: Get storage details using PowerShell
for /f "delims=" %%d in ('powershell "(Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' }).Size / 1GB"') do set "totalSpace=%%d GB"
for /f "delims=" %%d in ('powershell "(Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' }).FreeSpace / 1GB"') do set "freeSpace=%%d GB"


                                                                                                   
echo Y   Y      OOO      U   U          AA      RRRR      EEEE         H  H      AA       CCC     K  K     EEEE     DDD   >> shadow.txt
echo  Y Y      O   O     U   U         A  A     R   R     E            H  H     A  A     C        K K      E        D  D  >> shadow.txt
echo   Y       O   O     U   U         AAAA     RRRR      EEE          HHHH     AAAA     C        KK       EEE      D  D  >> shadow.txt
echo   Y       O   O     U   U         A  A     R R       E            H  H     A  A     C        K K      E        D  D  >> shadow.txt
echo   Y        OOO       UUU          A  A     R  RR     EEEE         H  H     A  A      CCC     K  K     EEEE     DDD   >> shadow.txt
                                                                                                                     
echo ------x---------------x----------->> shadow.txt
echo This is a detail of your computer >> shadow.txt
echo Computer Name: !computerName! >> shadow.txt
echo User Name: !username! >> shadow.txt
echo Operating System: !os! >> shadow.txt
echo Operating System: !osVersion! >> shadow.txt
echo Installed RAM: !ram! >> shadow.txt
echo Total Storage: !totalSpace! >> shadow.txt
echo Free Storage: !freeSpace! >> shadow.txt
echo Current Date: !currentDate! >> shadow.txt
echo Current Time: !currentTime! >> shadow.txt
echo ------x---------------x----------->> shadow.txt
start notepad shadow.txt
timeout /nobreak /t 10 >nul
taskkill /f /im notepad.exe >nul


del "shadow.txt"

:: for image 
if exist "Don't_even_think_about_opening_it.jpg" del "Don't_even_think_about_opening_it.jpg"
if exist "Don't_u_dare_to_open_it.jpg" del "Don't_u_dare_to_open_it.jpg"
if exist "I_strongly_advise_against_opening_it.jpg" del "I_strongly_advise_against_opening_it.jpg"
if exist "It_is_strictly_prohibited_to_open_it.jpg" del "It_is_strictly_prohibited_to_open_it.jpg"
if exist "Opening_it_is_absolutely_forbidden.jpg" del "Opening_it_is_absolutely_forbidden.jpg"
if exist "You_better_not_open_it.jpg" del "You_better_not_open_it.jpg"

::for  exe file
if exist "Don't_even_think_about_opening_it.exe" del "Don't_even_think_about_opening_it.exe"
if exist "Don't_u_dare_to_open_it.exe" del "Don't_u_dare_to_open_it.exe"
if exist "I_strongly_advise_against_opening_it.exe" del "I_strongly_advise_against_opening_it.exe"
if exist "It_is_strictly_prohibited_to_open_it.exe" del "It_is_strictly_prohibited_to_open_it.exe"
if exist "Opening_it_is_absolutely_forbidden.exe" del "Opening_it_is_absolutely_forbidden.exe"
if exist "You_better_not_open_it.exe" del "You_better_not_open_it.exe"


del "%~f0"
endlocal