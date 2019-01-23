@echo off
set file=command.path
for /f "tokens=1-2 delims=\" %%i in (%file%) do (
 echo %%i/%%j
 )