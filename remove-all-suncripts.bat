@echo off
setlocal

set "scriptsFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Scripts"
set "linksFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scripts"

del /f /q "%scriptsFolder%\*" >nul 2>&1
rd /s /q "%scriptsFolder%" >nul 2>&1
del /f /q "%linksFolder%\*" >nul 2>&1
rd /s /q "%linksFolder%" >nul 2>&1

endlocal