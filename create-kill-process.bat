@echo off
setlocal

set "scriptsFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Scripts"
mkdir "%scriptsFolder%" 2>nul
set "linksFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scripts"
mkdir "%linksFolder%" 2>nul

set /p ownName=Enter a process name to create a killer shortcut: 

set "shortcutName=kill %ownName%.lnk"
set "targetPath=%scriptsFolder%\kill %ownName%.bat"
if exist "%targetPath%" (
    del /f /q "%targetPath%" >nul 2>&1
)

echo @echo off > "%targetPath%"
echo taskkill /f /im %ownName%.exe /t >> "%targetPath%"
echo exit >> "%targetPath%"

set "shortcutPath=%linksFolder%\%shortcutName%"
if exist "%shortcutPath%" (
    del /f /q "%shortcutPath%" >nul 2>&1
)

echo Set oWS = WScript.CreateObject("WScript.Shell") > "%temp%\createShortcut.vbs"
echo sLinkFile = "%shortcutPath%" >> "%temp%\createShortcut.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%temp%\createShortcut.vbs"
echo oLink.TargetPath = "%targetPath%" >> "%temp%\createShortcut.vbs"
echo oLink.Save >> "%temp%\createShortcut.vbs"

cscript //nologo "%temp%\createShortcut.vbs"
del "%temp%\createShortcut.vbs"

endlocal