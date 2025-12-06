@echo off
title Level 2 Repair
echo Level 2 Repair

sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
netsh winsock reset
ipconfig /flushdns
chkdsk C: /r

del /f /s /q "%localappdata%\Temp\*.*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*.*" >nul 2>&1
