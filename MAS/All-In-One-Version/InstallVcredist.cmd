REM --add the following to the top of your bat file--


@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

@echo off
@setlocal enableextensions
mode con:cols=90 lines=30
color 0c

cls

call :_color2 %_Red% "       ______     ______     _____     ______     ______     ______"
call :_color2 %_Red% "      /\  ___\   /\  __ \   /\  __-.  /\  ___\   /\  ___\   /\  ___\"
call :_color2 %_Red% "      \ \ \____  \ \ \/\ \  \ \ \/\ \ \ \___  \  \ \  __\   \ \ \____"
call :_color2 %_Red% "       \ \_____\  \ \_____\  \ \____-  \/\_____\  \ \_____\  \ \_____\"
call :_color2 %_Red% "        \/_____/   \/_____/   \/____/   \/_____/   \/_____/   \/_____/"


:: Disable UAC
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f

:: Disable Smart Screen
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f > NUL

:: Download and attempt re-install
echo Re-installing VC_redist.x64
powershell Invoke-WebRequest -uri "https://pcxel.com.br/arquivos/VC_redistx86.exe" -OutFile ( New-Item -Path "C:\VC_redist.x86.exe" -Force )
powershell Invoke-WebRequest -uri "https://pcxel.com.br/arquivos/VC_redistx64.exe" -OutFile ( New-Item -Path "C:\VC_redist.x64.exe" -Force )
timeout 2 > NUL

C:\VC_redist.x64.exe /uninstall /passive /quiet /norestart
C:\VC_redist.x86.exe /uninstall /passive /quiet /norestart
timeout 2 > NUL

C:\VC_redist.x64.exe /install /passive /quiet /norestart
C:\VC_redist.x86.exe /install /passive /quiet /norestart
timeout 2 > NUL

del /f "C:\VC_redist.x64.exe"
del /f "C:\VC_redist.x86.exe"
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
