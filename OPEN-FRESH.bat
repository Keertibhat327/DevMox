@echo off
title AquaWatch - Force Fresh Load
cls
echo.
echo ========================================
echo   AquaWatch - FORCE FRESH LOAD
echo ========================================
echo.
echo This will:
echo 1. Kill any existing Python servers
echo 2. Start a fresh server
echo 3. Open with cache-busting URL
echo.
pause

REM Kill existing Python servers
echo Stopping any existing servers...
taskkill /F /IM python.exe 2>nul
taskkill /F /IM py.exe 2>nul
timeout /t 1 /nobreak >nul

REM Start fresh server
echo.
echo Starting fresh server on port 3000...
set "ROOT=%~dp0"
start /B py -m http.server 3000 --directory "%ROOT%frontend"
timeout /t 2 /nobreak >nul

REM Generate unique cache-busting URL
set "TIMESTAMP=%date:~-4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "TIMESTAMP=%TIMESTAMP: =0%"
set "URL=http://localhost:3000/index.html?v=7&nocache=%TIMESTAMP%"

echo.
echo ========================================
echo   Opening with cache-busting URL:
echo   %URL%
echo ========================================
echo.
echo If browser still shows old version:
echo 1. Press Ctrl+Shift+Delete
echo 2. Clear "Cached images and files"
echo 3. Close ALL browser windows
echo 4. Run this script again
echo.

REM Open in default browser
start "" "%URL%"

echo.
echo Server is running on port 3000
echo Press any key to stop the server...
pause >nul

REM Stop server
taskkill /F /IM python.exe 2>nul
taskkill /F /IM py.exe 2>nul
echo Server stopped.
timeout /t 2 /nobreak >nul
