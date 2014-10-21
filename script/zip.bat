ECHO OFF
color 70
CLS
set /p step=<script\txt\step.txt
title step %step% : Zip 
set /p nam=<script\txt\name.txt
set nam=%nam: =%
echo.
echo.
set name=ROM
rem setting name in case user doesnt
if %nam%==cm set name=Cynogen
if %nam%==stock set name=Stock
if %nam%==pa set name=Paranoid-Android
if %nam%==pac set name=PAC-Man
if %nam%==miui set name=MIUI
set /p name=What do you want the name of the rom to be : 
echo.
:zip
echo.
echo Zipping %nam% Rom Started >>script\txt\log.txt
echo   Zipping the Rom.
if not exist OUTPUT mkdir OUTPUT
copy essentials\7za.exe BASE
cd BASE
rem zipping it
7za a -mx9 -tzip "%name%.zip" "*"
if errorlevel 1 (
echo Sorry, But an error occured
echo Errored Out at Zipping Rom >>script\txt\log.txt
PAUSE
call script\fail.bat
)  
del 7za.exe
CD..
move BASE\%name%.zip OUTPUT
copy essentials\7za.exe OUTPUT
cd OUTPUT
rem deleting 7za.exe from the zip
7za d %name%.zip 7za.exe
del 7za.exe
cd..

echo.
echo Done
echo.
set /a step+=1
echo %step% >script\txt\step.txt
echo Zipping %nam% Rom Completed Successfully >>script\txt\log.txt
echo. >>script\txt\log.txt
pause

call script\success.bat

