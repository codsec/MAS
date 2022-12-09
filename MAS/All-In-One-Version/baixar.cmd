@echo off
curl --create-dirs -O --output-dir /Download https://pcxel.com.br/arquivos/RpcAuthnLevelPrivacyEnabled.reg
regedit.exe /s C:\Download\RpcAuthnLevelPrivacyEnabled.reg
pause
