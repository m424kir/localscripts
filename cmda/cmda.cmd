@echo off
@if not "%~0"=="%~dp0.\%~nx0" start /min cmd /c,"%~dp0.\%~nx0" %* & goto :eof
powershell -windowstyle hidden -command start cmd -ArgumentList '/k ""cd /d %CD%""' -verb runas
