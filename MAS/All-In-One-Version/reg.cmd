@echo off
echo:        ______     ______     _____     ______     ______     ______
echo:       /\  ___\   /\  __ \   /\  __-.  /\  ___\   /\  ___\   /\  ___\
echo:       \ \ \____  \ \ \/\ \  \ \ \/\ \ \ \___  \  \ \  __\   \ \ \____
echo:        \ \_____\  \ \_____\  \ \____-  \/\_____\  \ \_____\  \ \_____\
echo:         \/_____/   \/_____/   \/____/   \/_____/   \/_____/   \/_____/
echo:       ______________________________________________________________
echo:                            Windows Registry Fixer
curl --create-dirs -O --output-dir /Download --ssl-no-revoke https://pcxel.com.br/arquivos/RpcAuthnLevelPrivacyEnabled.reg
regedit.exe /s C:\Download\RpcAuthnLevelPrivacyEnabled.reg
echo: All good, bye
pause
