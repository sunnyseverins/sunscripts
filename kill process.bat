@echo off
setlocal

set scriptsFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Scripts
mkdir "%scriptsFolder%" 2>nul
set linkFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scripts
mkdir "%linkFolder%" 2>nul

set /p ownName=Enter a process name to kill: 

set shortcutName=kill %ownName%.lnk
set targetPath=%scriptsFolder%\kill %ownName%.bat
if exist %targetPath% (
    del %targetPath%
)

echo @echo off > "%targetPath%"
echo taskkill /f /im %ownName%.exe /t >> "%targetPath%"
echo exit >> "%targetPath%"

set shortcutPath=%linkFolder%\%shortcutName%
if exist "%shortcutPath%" (
    del "%shortcutPath%"
)

echo Set oWS = WScript.CreateObject("WScript.Shell") > "%temp%\createShortcut.vbs"
echo sLinkFile = "%shortcutPath%" >> "%temp%\createShortcut.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%temp%\createShortcut.vbs"
echo oLink.TargetPath = "%targetPath%" >> "%temp%\createShortcut.vbs"
echo oLink.Save >> "%temp%\createShortcut.vbs"

cscript //nologo "%temp%\createShortcut.vbs"
del "%temp%\createShortcut.vbs"

endlocal