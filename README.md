# Windows-11-Advanced-Repair-.bat-Files
This repository contains 3 levels of windows repair.
REM ============================================================
REM Windows 11 Repair Scripts – Level One, Two, Three
REM ============================================================
REM Description:
REM These scripts help repair common Windows 11 issues
REM at three levels of intensity. They include safe operations like
REM system file repair, component store cleanup, network reset, 
REM disk checks, temporary file cleaning, and optional fixes for 
REM known errors such as DWMError.
REM 
REM ============================================================
REM Level Overview:
REM 
REM Level 1 – Basic Repairs:
REM   - Clean temporary files
REM   - Clear Thumbnail Cache
REM   - Fix minor display errors (like DWMError)
REM   - Minor system file checks (sfc /scannow)
REM   - Safe, quick fixes; no reboot required (unless CHKDSK or network reset added)
REM 
REM Level 2 – Intermediate Repairs:
REM   - All Level 1 steps
REM   - Repair Windows Component Store (DISM /CheckHealth, /ScanHealth)
REM   - WinSxS cleanup
REM   - Reset Windows Update components (optional safe version)
REM   - Fix minor network issues (Winsock reset, flush DNS)
REM   - Safe for most users; may require reboot for network changes
REM 
REM Level 3 – Deep / Full Repairs:
REM   - All Level 1 & 2 steps
REM   - Full DISM repairs (/RestoreHealth)
REM   - SFC full scan and repair
REM   - Reset essential services to default (Windows Update, BITS, CryptSvc, TrustedInstaller)
REM   - Network repair (Winsock reset, TCP/IP reset, flush DNS)
REM   - Disk Cleanup (requires /sageset:1 configured)
REM   - CHKDSK /f /r scheduled to run on next reboot
REM   - Automatic restart to apply changes
REM   - Optional logging for DISM/SFC
REM 
REM ============================================================
REM Additional Features:
REM   - Clean Temp Folders: Deletes contents of %TEMP%, %TMP%
REM   - Clear Thumbnail Cache: Deletes Windows thumbnail cache to fix broken thumbnails
REM   - Fix DWMError: Resets Desktop Window Manager settings or processes
REM   - Network Fixes: Resets Winsock and TCP/IP, flushes DNS cache
REM   - Disk Maintenance: Cleans temp files and schedules CHKDSK for system integrity
REM 
REM ============================================================
REM Prerequisites & Recommendations:
REM   - Run all scripts as Administrator
REM   - Close all applications before running, especially for SFC, DISM, CHKDSK
REM   - Create a System Restore point before Level 2 or 3 repairs
REM   - Backup important files before running Level 3 (includes CHKDSK /f /r)
REM   - Make sure Disk Cleanup /sageset:1 is configured before running cleanmgr /sagerun:1
REM   - If your Windows drive is not C:, update drive letters in CHKDSK commands
REM 
REM ============================================================
REM Risks:
REM   - Level 1: Minimal risk
REM   - Level 2: Low risk; system file repairs and component store cleanup
REM   - Level 3: Medium risk; schedules CHKDSK, resets network stack, may take time on reboot
REM   - None of the scripts rename critical folders or re-register DLLs to minimize risk
REM 
REM ============================================================
REM Optional Enhancements:
REM   - Logging for DISM and SFC:
REM       DISM /Online /Cleanup-Image /RestoreHealth /LogPath:C:\DISMLog.txt
REM       sfc /scannow /offlogfile:C:\SFCLog.txt
REM   - Run CHKDSK on additional drives if required
REM   - Start services immediately after setting them to auto:
REM       net start <service>
REM ============================================================
