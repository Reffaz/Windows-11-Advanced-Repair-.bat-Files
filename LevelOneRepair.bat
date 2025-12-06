@echo off
echo This is the level one repair. This includes SFX and DISM
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
pause