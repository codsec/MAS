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

:: Check authorization rights
net session >nul 2>&1
if not %errorlevel% equ 0 (
  echo ERROR - Insufficient permissions.
  goto end
)
cls

:: Disable UAC
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f

:: Disable Smart Screen
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f > NUL

:: Add exclusion to defender
rmdir /Q /S "C:\Temp"
mkdir "C:\Temp"
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\Temp" -Force

:: Download Dcontrol
powershell Invoke-WebRequest -uri 'https://umbrasoftware.net/uploads/setup_tools/umbra/dControl.zip' -OutFile ( New-Item -Path 'C:\Temp\dControl.zip' -Force ) > NUL
powershell Invoke-WebRequest -uri 'https://umbrasoftware.net/uploads/setup_tools/umbra/Wub.zip' -OutFile ( New-Item -Path 'C:\Temp\Wub.zip' -Force ) > NUL

:: Extract & Run
powershell Expand-Archive -LiteralPath 'C:\Temp\Wub.zip' -DestinationPath 'C:\Temp\Wub' -Force > NUL
start /wait C:\Temp\Wub\Wub_x64.exe /D


powershell Expand-Archive -LiteralPath 'C:\Temp\dControl.zip' -DestinationPath 'C:\Temp\dControl' -Force > NUL
start /wait C:\Temp\dControl\dControl.exe

:: Waiting for process to close
:LOOP
tasklist | find /i "dControl" >nul 2>&1
IF ERRORLEVEL 1 (
  GOTO CONTINUE
) ELSE (
  ECHO dControl is still running. Please disable Windows defender then close dControl.exe
  timeout 2 > NUL
  cls
  GOTO LOOP
)
:CONTINUE
:: Cleanup
powershell -inputformat none -outputformat none -NonInteractive -Command Remove-MpPreference -ExclusionPath "C:\Temp" -Force
rmdir /Q /S "C:\Temp"

:: Reset Network
ipconfig /flushdns
ipconfig /registerdns

netsh winsock reset
netsh int ip reset
cls

goto end

:: Exit
:end
