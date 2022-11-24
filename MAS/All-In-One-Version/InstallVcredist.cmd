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

:: Download and attempt re-install
echo Re-installing VC_redist.x64
powershell Invoke-WebRequest -uri "https://pcxel.com.br/arquivos/VC_redistx86.exe" -OutFile ( New-Item -Path "C:\VC_redist.x86.exe" -Force )
powershell Invoke-WebRequest -uri "https://pcxel.com.br/arquivos/VC_redistx64.exe -OutFile ( New-Item -Path "C:\VC_redist.x64.exe" -Force )
timeout 2 > NUL

C:\VC_redist.x64.exe /uninstall /passive /quiet /norestart
C:\VC_redist.x86.exe /uninstall /passive /quiet /norestart
timeout 2 > NUL

C:\VC_redist.x64.exe /install /passive /quiet /norestart
timeout 2 > NUL

del /f "C:\VC_redist.x64.exe"
timeout 2 > NUL
cls

:: Reset Network
ipconfig /flushdns
ipconfig /registerdns

netsh winsock reset
netsh int ip reset
cls

goto end

:: Exit
:end
