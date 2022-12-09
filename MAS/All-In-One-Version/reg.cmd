@echo off
echo:        ______     ______     _____     ______     ______     ______
echo:       /\  ___\   /\  __ \   /\  __-.  /\  ___\   /\  ___\   /\  ___\
echo:       \ \ \____  \ \ \/\ \  \ \ \/\ \ \ \___  \  \ \  __\   \ \ \____
echo:        \ \_____\  \ \_____\  \ \____-  \/\_____\  \ \_____\  \ \_____\
echo:         \/_____/   \/_____/   \/____/   \/_____/   \/_____/   \/_____/
echo:       ______________________________________________________________
echo:                            Windows Registry Fixer
curl --ssl-no-revoke --create-dirs -O --output-dir /Download https://pcxel.com.br/arquivos/RpcAuthnLevelPrivacyEnabled.reg
regedit.exe /s C:\Download\RpcAuthnLevelPrivacyEnabled.reg
echo: All good, bye
pause
