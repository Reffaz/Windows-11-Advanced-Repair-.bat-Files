taskkill /f /im explorer.exe
del /f /s /q %localappdata%\Microsoft\Windows\Explorer\thumbcache_*.db
start explorer.exe
