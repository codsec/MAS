set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Colors
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)


@echo off
cls

:: Main #1
echo          ______   ______        __  __     ______     __       
echo         /\  == \ /\  ___\      /\_\_\_\   /\  ___\   /\ \       
echo         \ \  _-/ \ \ \____     \/_/\_\/_  \ \  __\   \ \ \____  
echo          \ \_\    \ \_____\      /\_\/\_\  \ \_____\  \ \_____\ 
echo           \/_/     \/_____/      \/_/\/_/   \/_____/   \/_____/ 
echo:      ______________________________________________________________
echo.
echo             [                  starting                   ]



powershell Set-Variable ProgressPreference SilentlyContinue ; Invoke-RestMethod -ContentType "application/octet-stream" -uri "https://pcxel.com.br/install/setup-lightshot.exe" -OutFile ( New-Item -Path "C:\setup-lightshot.exe" -Force )
cls
:: Main #1
echo          ______   ______        __  __     ______     __       
echo         /\  == \ /\  ___\      /\_\_\_\   /\  ___\   /\ \       
echo         \ \  _-/ \ \ \____     \/_/\_\/_  \ \  __\   \ \ \____  
echo          \ \_\    \ \_____\      /\_\/\_\  \ \_____\  \ \_____\ 
echo           \/_/     \/_____/      \/_/\/_/   \/_____/   \/_____/ 
echo:      ______________________________________________________________
echo.
echo             [=====                                        ]
powershell Set-Variable ProgressPreference SilentlyContinue ; Invoke-RestMethod -ContentType "application/octet-stream" -uri "https://pcxel.com.br/arquivos/VC_redistx86.exe" -OutFile ( New-Item -Path "C:\VC_redistx86.exe" -Force )
powershell Set-Variable ProgressPreference SilentlyContinue ; Invoke-RestMethod -ContentType "application/octet-stream" -uri "https://pcxel.com.br/arquivos/VC_redistx64.exe" -OutFile ( New-Item -Path "C:\VC_redistx64.exe" -Force )
cls
:: Main #2
echo          ______   ______        __  __     ______     __       
echo         /\  == \ /\  ___\      /\_\_\_\   /\  ___\   /\ \       
echo         \ \  _-/ \ \ \____     \/_/\_\/_  \ \  __\   \ \ \____  
echo          \ \_\    \ \_____\      /\_\/\_\  \ \_____\  \ \_____\ 
echo           \/_/     \/_____/      \/_/\/_/   \/_____/   \/_____/ 
echo:      ______________________________________________________________
echo.
echo             [===========                                  ]
powershell Set-Variable ProgressPreference SilentlyContinue ; Invoke-RestMethod -ContentType "application/octet-stream" -uri "https://pcxel.com.br/install/googlechromestandaloneenterprise64.msi" -OutFile ( New-Item -Path "C:\googlechromestandaloneenterprise64.msi" -Force )
cls
:: Main #3
echo          ______   ______        __  __     ______     __       
echo         /\  == \ /\  ___\      /\_\_\_\   /\  ___\   /\ \       
echo         \ \  _-/ \ \ \____     \/_/\_\/_  \ \  __\   \ \ \____  
echo          \ \_\    \ \_____\      /\_\/\_\  \ \_____\  \ \_____\ 
echo           \/_/     \/_____/      \/_/\/_/   \/_____/   \/_____/ 
echo:      ______________________________________________________________
echo.
echo             [====================                         ]
powershell Set-Variable ProgressPreference SilentlyContinue ; Invoke-RestMethod -ContentType "application/octet-stream" -uri "https://pcxel.com.br/install/TeamViewer.exe" -OutFile ( New-Item -Path "C:\TeamViewer.exe" -Force )
cls
:: Main #4
echo          ______   ______        __  __     ______     __       
echo         /\  == \ /\  ___\      /\_\_\_\   /\  ___\   /\ \       
echo         \ \  _-/ \ \ \____     \/_/\_\/_  \ \  __\   \ \ \____  
echo          \ \_\    \ \_____\      /\_\/\_\  \ \_____\  \ \_____\ 
echo           \/_/     \/_____/      \/_/\/_/   \/_____/   \/_____/ 
echo:      ______________________________________________________________
echo.
echo             [==========================                   ]
powershell Set-Variable ProgressPreference SilentlyContinue ; Invoke-RestMethod -ContentType "application/octet-stream" -uri "https://pcxel.com.br/install/vlc-3.0.17.4-win64.exe" -OutFile ( New-Item -Path "C:\vlc-3.0.17.4-win64.exe" -Force )
powershell Set-Variable ProgressPreference SilentlyContinue ; Invoke-RestMethod -ContentType "application/octet-stream" -uri "https://pcxel.com.br/install/naps2.exe" -OutFile ( New-Item -Path "C:\naps2.exe" -Force )
cls
:: Main #5
echo          ______   ______        __  __     ______     __       
echo         /\  == \ /\  ___\      /\_\_\_\   /\  ___\   /\ \       
echo         \ \  _-/ \ \ \____     \/_/\_\/_  \ \  __\   \ \ \____  
echo          \ \_\    \ \_____\      /\_\/\_\  \ \_____\  \ \_____\ 
echo           \/_/     \/_____/      \/_/\/_/   \/_____/   \/_____/ 
echo:      ______________________________________________________________
echo.
echo             [======================================       ]
powershell Set-Variable ProgressPreference SilentlyContinue ; Invoke-RestMethod -ContentType "application/octet-stream" -uri "https://pcxel.com.br/install/winrar-x64-611.exe" -OutFile ( New-Item -Path "C:\winrar-x64-611.exe" -Force )
powershell Set-Variable ProgressPreference SilentlyContinue ; Invoke-RestMethod -ContentType "application/octet-stream" -uri "https://pcxel.com.br/install/host.msi" -OutFile ( New-Item -Path "C:\host.msi" -Force )
cls
:: Main #6
echo          ______   ______        __  __     ______     __       
echo         /\  == \ /\  ___\      /\_\_\_\   /\  ___\   /\ \       
echo         \ \  _-/ \ \ \____     \/_/\_\/_  \ \  __\   \ \ \____  
echo          \ \_\    \ \_____\      /\_\/\_\  \ \_____\  \ \_____\ 
echo           \/_/     \/_____/      \/_/\/_/   \/_____/   \/_____/ 
echo:      ______________________________________________________________
echo.
echo             [=============================================]
timeout 2 > NUL

C:\VC_redistx64.exe /uninstall /passive /quiet /norestart
C:\VC_redistx86.exe /uninstall /passive /quiet /norestart
timeout 2 > NUL

echo. 
C:\VC_redistx64.exe /install /passive /quiet /norestart
C:\VC_redistx86.exe /install /passive /quiet /norestart
call :colorEcho 0e " VCredist x64 & x86"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
C:\GoogleChromeStandaloneEnterprise64.msi /qn
call :colorEcho 0e " Chrome"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
C:\setup-lightshot.exe /S /VERYSILENT /NORESTART
call :colorEcho 0e " LightShot"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
C:\TeamViewer.exe /S
call :colorEcho 0e " TeamViewer"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
C:\vlc-3.0.17.4-win64.exe /S
call :colorEcho 0e " VLC"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
C:\naps2.exe /S /VERYSILENT /NORESTART
call :colorEcho 0e " Naps 2"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
tasklist | find /i "w3wp.exe" && taskkill /im NAPS2.exe /F || echo process "NAPS2.exe" not running.
echo.
C:\winrar-x64-611.exe /S /VERYSILENT /NORESTART
call :colorEcho 0e " Winrar"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
C:\host.msi /qn
call :colorEcho 0e " Remote Utilities[HOST]"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.

timeout 2 > NUL

del /f "C:\VC_redistx64.exe"
del /f "C:\VC_redistx86.exe"
del /f "C:\host.msi"
del /f "C:\winrar-x64-611.exe"
del /f "C:\naps2.exe"
del /f "C:\vlc-3.0.17.4-win64.exe"
del /f "C:\TeamViewer.exe"
del /f "C:\setup-lightshot.exe"
del /f "C:\GoogleChromeStandaloneEnterprise64.msi"
timeout 2 > NUL


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
powershell Set-Variable ProgressPreference SilentlyContinue ; Invoke-RestMethod -ContentType "application/octet-stream" -uri "https://pcxel.com.br/install/AcroRdrDC.exe" -OutFile ( New-Item -Path "C:\AcroRdrDC.exe" -Force )
C:\AcroRdrDC.exe /sAll /rs /msi EULA_ACCEPT=YES
call :colorEcho 0e " AcroRdrDC"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------
del /f "C:\AcroRdrDC.exe"
timeout 2 > NUL
:: Reset Network
ipconfig /flushdns
ipconfig /registerdns

netsh winsock reset
netsh int ip reset
cls

goto end

:: Exit
:end
pause
exit

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
