set scriptsFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Scripts
mkdir "%scriptsFolder%" 2>nul
set linkFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scripts
mkdir "%linkFolder%" 2>nul

set ownName=%~n0.bat
set shortcutName=%~n0.lnk
set targetPath=%scriptsFolder%\%ownName%
if exist %targetPath% (
    del %targetPath%
)

echo @echo off > "%targetPath%"
echo taskkill /f /im urban-vpn-app.exe /t >> "%targetPath%"
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