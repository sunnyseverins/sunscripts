@echo off
setlocal

set "scriptsFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Scripts"
mkdir "%scriptsFolder%" 2>nul
set "linksFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scripts"
mkdir "%linksFolder%" 2>nul

set "scriptName=re explorer"

set "shortcutName=%scriptName%.lnk"
set "targetPath=%scriptsFolder%\%scriptName%.bat"
if exist "%targetPath%" (
    del /f /q "%targetPath%" >nul 2>&1
)

echo @echo off > "%targetPath%"
echo taskkill /f /im explorer.exe >nul 2>&1 >> "%targetPath%"
echo timeout /t 2 /nobreak >nul >> "%targetPath%"
echo start "" explorer.exe >> "%targetPath%"
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