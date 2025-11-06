@echo off
setlocal

set "scriptsFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Scripts"
set "linksFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scripts"

set /p ownName=Enter a process name to remove a killer shortcut: 

set "shortcutName=kill %ownName%.lnk"
set "targetPath=%scriptsFolder%\kill %ownName%.bat"
if exist "%targetPath%" (
    del /f /q "%targetPath%" >nul 2>&1
)
set "shortcutPath=%linksFolder%\%shortcutName%"
if exist "%shortcutPath%" (
    del /f /q "%shortcutPath%" >nul 2>&1
)

endlocal