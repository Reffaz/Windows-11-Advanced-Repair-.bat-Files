
This repository contains Windows 11 repair scripts at three levels of intensity, including other batch files.
These scripts repair common Windows issues using safe operations like system file repair, component store cleanup, network reset, disk checks, and temporary file cleaning.

Level Overview
Level 1 – Basic Repairs
DISM component store check and repair (DISM /Online /Cleanup-Image /CheckHealth /ScanHealth /RestoreHealth)
System File Checker (sfc /scannow)
Safe, quick fixes; no reboot required unless CHKDSK is added manually
Minimal risk

Level 2 – Intermediate Repairs
All Level 1 steps
Network reset:
netsh winsock reset
ipconfig /flushdns
Disk repair: CHKDSK /f /r (scheduled for next reboot)
Deletes temporary files (%TEMP% and %TMP%)
Safe for most users; may require reboot for network and disk repairs

Level 3 – Deep / Full Repairs
All Level 1 & 2 steps
Reset essential services to default (Windows Update, BITS, CryptSvc, TrustedInstaller)
WinSxS cleanup (Dism.exe /online /Cleanup-Image /StartComponentCleanup)
Automatic restart to apply changes
Optional logging for DISM/SFC
Medium risk; may take time on reboot due to CHKDSK and network reset

Additional Features
Clean Temp Folders Deletes contents of %TEMP% and %TMP%
Clear Thumbnail Cache: Deletes Windows thumbnail cache to fix broken thumbnails
Fix DWMError: Resets Desktop Window Manager settings or processes
Network Fixes: Resets Winsock, flushes DNS cache, optional TCP/IP reset
Disk Maintenance: Cleans temp files and schedules CHKDSK for system integrity

Recommendations
Run all scripts as Administrator
Close all applications before running, especially for SFC, DISM, CHKDSK
Create a System Restore point before Level 2 or 3 repairs
Backup important files before running Level 3 (includes CHKDSK /f /r)
If your Windows drive is not C:, update drive letters in CHKDSK commands

Risks
Level 1: Minimal risk; only DISM & SFC
Level 2: Low risk; system file repair, network reset, temp deletion, and disk repair
Level 3: Medium risk; resets services, runs CHKDSK, network stack resets, may take time on reboot

Notes for All BATs
Temp Folder Cleaner
Deletes contents of %TEMP% and %TMP% folders
Frees disk space and removes leftover temporary files
Safe; may require elevated privileges for some files
No system files are affected
Network Reset
netsh winsock reset → resets TCP/IP stack, fixes connectivity issues
ipconfig /flushdns → clears DNS resolver cache
Requires reboot to fully take effect
Disk Repair
CHKDSK /f /r → checks for file system errors and bad sectors
Runs automatically on next reboot
Can take 30–90+ minutes depending on disk size

63 lines wow lol
