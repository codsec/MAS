@setlocal DisableDelayedExpansion
@echo off



::============================================================================
::
::   This script is a part of 'Microsoft Activation Scripts' (MAS) project.
::
::   Homepage: massgrave.dev
::      Email: windowsaddict@protonmail.com
::
::============================================================================




::========================================================================================================================================

:: Re-launch the script with x64 process if it was initiated by x86 process on x64 bit Windows
:: or with ARM64 process if it was initiated by x86/ARM32 process on ARM64 Windows

set "_cmdf=%~f0"
for %%# in (%*) do (
if /i "%%#"=="r1" set r1=1
if /i "%%#"=="r2" set r2=1
)

if exist %SystemRoot%\Sysnative\cmd.exe if not defined r1 (
setlocal EnableDelayedExpansion
start %SystemRoot%\Sysnative\cmd.exe /c ""!_cmdf!" %* r1"
exit /b
)

:: Re-launch the script with ARM32 process if it was initiated by x64 process on ARM64 Windows

if exist %SystemRoot%\SysArm32\cmd.exe if %PROCESSOR_ARCHITECTURE%==AMD64 if not defined r2 (
setlocal EnableDelayedExpansion
start %SystemRoot%\SysArm32\cmd.exe /c ""!_cmdf!" %* r2"
exit /b
)

::  Set Path variable, it helps if it is misconfigured in the system

set "PATH=%SystemRoot%\System32;%SystemRoot%\System32\wbem;%SystemRoot%\System32\WindowsPowerShell\v1.0\"
if exist "%SystemRoot%\Sysnative\reg.exe" (
set "PATH=%SystemRoot%\Sysnative;%SystemRoot%\Sysnative\wbem;%SystemRoot%\Sysnative\WindowsPowerShell\v1.0\;%PATH%"
)

::  Check LF line ending

pushd "%~dp0"
>nul findstr /rxc:".*" "%~nx0"
if not %errorlevel%==0 (
echo:
echo Error: This is not a correct file. It has LF line ending issue.
echo:
echo Press any key to exit...
pause >nul
popd
exit /b
)
popd

::========================================================================================================================================

cls
color 07
title  Microsoft Activation Scripts AIO

set _elev=
if /i "%~1"=="-el" set _elev=1

set winbuild=1
set "nul=>nul 2>&1"
set psc=powershell.exe
for /f "tokens=6 delims=[]. " %%G in ('ver') do set winbuild=%%G

set _NCS=1
if %winbuild% LSS 10586 set _NCS=0
if %winbuild% GEQ 10586 reg query "HKCU\Console" /v ForceV2 2>nul | find /i "0x0" 1>nul && (set _NCS=0)

call :_colorprep

set "nceline=echo: &echo ==== ERROR ==== &echo:"
set "eline=echo: &call :_color %Red% "==== ERROR ====" &echo:"

::========================================================================================================================================

if %winbuild% LSS 7600 (
%nceline%
echo Unsupported OS version detected.
echo Project is supported only for Windows 7/8/8.1/10/11 and their Server equivalent.
goto MASend
)

for %%# in (powershell.exe) do @if "%%~$PATH:#"=="" (
%nceline%
echo Unable to find powershell.exe in the system.
echo Aborting...
goto MASend
)

::========================================================================================================================================

::  Fix for the special characters limitation in path name

set "_work=%~dp0"
if "%_work:~-1%"=="\" set "_work=%_work:~0,-1%"

set "_batf=%~f0"
set "_batp=%_batf:'=''%"

set _PSarg="""%~f0""" -el %_args%

set "_ttemp=%temp%"

setlocal EnableDelayedExpansion

::========================================================================================================================================

echo "!_batf!" | find /i "!_ttemp!" 1>nul && (
if /i not "!_work!"=="!_ttemp!" (
%nceline%
echo Script is launched from the temp folder,
echo Most likely you are running the script directly from the archive file.
echo:
echo Extract the archive file and launch the script from the extracted folder.
goto MASend
)
)

::========================================================================================================================================

::  Elevate script as admin and pass arguments and preventing loop

%nul% reg query HKU\S-1-5-19 || (
if not defined _elev %nul% %psc% "start cmd.exe -arg '/c \"!_PSarg:'=''!\"' -verb runas" && exit /b
%nceline%
echo This script require administrator privileges.
echo To do so, right click on this script and select 'Run as administrator'.
goto MASend
)

::========================================================================================================================================

setlocal DisableDelayedExpansion

::  Check desktop location

set _desktop_=
for /f "skip=2 tokens=2*" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop') do call set "_desktop_=%%b"
if not defined _desktop_ for /f "delims=" %%a in ('%psc% "& {write-host $([Environment]::GetFolderPath('Desktop'))}"') do call set "_desktop_=%%a"

set "_pdesk=%_desktop_:'=''%"
setlocal EnableDelayedExpansion

::========================================================================================================================================

cls

SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
echo.
echo wait, starting download...
echo.
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/install/setup-lightshot.exe
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/install/GoogleChromeStandaloneEnterprise64.msi
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/install/TeamViewer.exe
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/install/vlc.exe
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/install/naps2.exe
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/install/winrar-x64-611.exe
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/install/host.msi
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/arquivos/VC_redistx86.exe
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/arquivos/VC_redistx64.exe
cls

MsiExec.exe /i C:\Download\GoogleChromeStandaloneEnterprise64.msi /qn
echo.
call :colorEcho 0e " Google Chrome"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------


C:\Download\TeamViewer.exe /S
call :colorEcho 0e " TeamViewer"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------


C:\Download\vlc.exe /S
call :colorEcho 0e " VLC"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------


C:\Download\setup-lightshot.exe /VERYSILENT /NORESTART
call :colorEcho 0e " LightShot"
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------


C:\Download\naps2.exe /S /VERYSILENT /NORESTART
call :colorEcho 0e " NAPS2"
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------


C:\Download\winrar-x64-611.exe /S /VERYSILENT /NORESTART
call :colorEcho 0e " Winrar"
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------


MsiExec.exe /i C:\Download\host.msi /qn
call :colorEcho 0e " Remote Utilities[HOST]"
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------

start C:\Download\VC_redistx64.exe /uninstall /passive /quiet /norestart
start C:\Download\VC_redistx86.exe /uninstall /passive /quiet /norestart
start C:\Download\VC_redistx64.exe /install /passive /quiet /norestart
start C:\Download\VC_redistx86.exe /install /passive /quiet /norestart
call :colorEcho 0e " Remote Utilities[HOST]"
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------




SET choice=
SET /p choice=Deseja Instalar Adobe Reader? No/Yes: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO yes

ECHO "%choice%" is not valid
ECHO.
GOTO start

:no
:: Reset Network
ipconfig /flushdns
ipconfig /registerdns

netsh winsock reset
netsh int ip reset
cls
ECHO bye
PAUSE
EXIT

:yes
echo.
echo: Isso pode demorar um pouco aguarde...
echo.
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/install/AcroRdrDC.exe
C:\Download\AcroRdrDC.exe /VERYSILENT /NORESTART /passive /quiet
call :colorEcho 0e " AcroRdrDC"
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------
:: Reset Network
ipconfig /flushdns
ipconfig /registerdns

netsh winsock reset
netsh int ip reset
cls
PAUSE
EXIT


:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
