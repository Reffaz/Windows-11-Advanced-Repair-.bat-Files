@echo off
title Windows 11 Level Three Repair
REM ================= Notes =================
REM Windows 11 Level Three Repair
REM 
REM Steps:
REM 1. DISM: repairs Windows component store.
REM 2. SFC: repairs protected system files.
REM 3. WinSxS cleanup: frees space from old components.
REM 4. Services reset: sets wuauserv, bits, cryptsvc, TrustedInstaller to auto.
REM 5. Network reset: winsock reset, TCP/IP reset, flush DNS (reboot required).
REM 6. Disk Cleanup: cleans temp/system files (requires /sageset:1 setup).
REM 7. CHKDSK: /f /r scheduled on reboot to fix disk errors and recover data.
REM 8. Restart: automatically applies all repairs and runs CHKDSK.
REM 
REM Precautions:
REM - Save work; PC will restart automatically.
REM - Backup important files or create System Restore.
REM - CHKDSK may take 30–90+ minutes depending on disk.
REM - If Windows is not on C:, update chkdsk drive letter.
REM 
REM Optional:
REM - Add DISM/SFC logs: /LogPath:C:\DISMLog.txt and /offlogfile:C:\SFCLog.txt
REM - Run CHKDSK on other drives if needed.
REM 

:: 1. DISM Health Check & Restore
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

:: 2. System File Checker
sfc /scannow

:: 3. WinSxS Cleanup
Dism.exe /online /Cleanup-Image /StartComponentCleanup

:: 4. Restore essential services to automatic
sc config wuauserv start=auto
sc config bits start=auto
sc config cryptsvc start=auto
sc config TrustedInstaller start=auto

:: 5. Network reset
netsh winsock reset
netsh int ip reset
ipconfig /flushdns

:: 6. Disk Cleanup 
cleanmgr /sagerun:1

:: 7. CHKDSK
echo Y|chkdsk C: /f /r

:: 8. Finish

echo Press any key to finish...
pause >nul

