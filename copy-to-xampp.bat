@echo off
echo Copying registration files to XAMPP htdocs...
echo.

set SOURCE=%~dp0
set DEST=C:\xampp\htdocs\registration

if not exist "C:\xampp\htdocs" (
    echo ERROR: XAMPP htdocs folder not found at C:\xampp\htdocs
    echo Please make sure XAMPP is installed or update the DEST path in this script.
    pause
    exit /b 1
)

if exist "%DEST%" (
    echo Removing old registration folder...
    rmdir /s /q "%DEST%"
)

echo Copying files...
xcopy /E /I /Y "%SOURCE%" "%DEST%"

echo.
echo Files copied successfully!
echo.
echo Now open your browser and go to: http://localhost/registration/public/register.php
echo.
pause
