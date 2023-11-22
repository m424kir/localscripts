@echo off
chcp 65001 > nul
setlocal

rem Restart Explorer
taskkill.exe /f /im explorer.exe > nul
start explorer.exe > nul

endlocal
exit /b 0