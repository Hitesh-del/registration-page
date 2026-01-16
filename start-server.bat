@echo off
echo Starting PHP Development Server...
echo.
echo Open your browser and go to: http://localhost:8000/register.php
echo.
echo Press Ctrl+C to stop the server
echo.
cd /d "%~dp0public"
php -S localhost:8000
