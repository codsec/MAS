@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

echo:-------------------------------
echo.
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/install/GoogleChromeStandaloneEnterprise64.msi
MsiExec.exe /i C:\Download\GoogleChromeStandaloneEnterprise64.msi /qn
echo.
call :colorEcho 0e "Google Chrome"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------

curl --create-dirs -O --output-dir /Download https://pcxel.com.br/install/TeamViewer.exe
C:\Download\TeamViewer.exe /S
call :colorEcho 0e "TeamViewer"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------

curl --create-dirs -O --output-dir /Download https://pcxel.com.br/install/vlc.exe
C:\Download\vlc.exe /S
call :colorEcho 0e "VLC"
timeout 2 > NUL
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------

curl --create-dirs -O --output-dir /Download https://pcxel.com.br/lightshot.exe
C:\Download\lightshot.exe /VERYSILENT /NORESTART
call :colorEcho 0e "LightShot"
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------

curl --create-dirs -O --output-dir /Download https://pcxel.com.br/naps2.exe
C:\Download\naps2.exe /S /VERYSILENT /NORESTART
call :colorEcho 0e "NAPS2"
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------

curl --create-dirs -O --output-dir /Download https://pcxel.com.br/winrar-x64-611.exe
C:\Download\winrar-x64-611.exe /S /VERYSILENT /NORESTART
call :colorEcho 0e "Winrar"
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------

curl --create-dirs -O --output-dir /Download https://pcxel.com.br/host.msi
MsiExec.exe /i C:\Download\host.msi /qn
call :colorEcho 0e "Remote Utilities[HOST]"
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------

curl --create-dirs -O --output-dir /Download https://pcxel.com.br/AcroRdrDC.exe
C:\Download\AcroRdrDC.exe /VERYSILENT /NORESTART /passive /quiet
call :colorEcho 0e "AcroRdrDC"
call :colorEcho 0a " Finished!"
echo.
echo:-------------------------------

pause
exit

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
