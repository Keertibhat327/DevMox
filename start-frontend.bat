@echo off
title AquaVision Frontend
set "ROOT=%~dp0"
echo.
echo ========================================
echo   AquaVision Frontend Server
echo ========================================
echo.
echo Starting server on port 3000...
echo.
echo IMPORTANT: If you don't see new features:
echo 1. Press Ctrl+F5 to hard refresh
echo 2. Or open: http://localhost:3000?nocache=%random%
echo.
timeout /t 2 /nobreak >nul
start "" "http://localhost:3000?v=7&t=%time::=-%"
py -m http.server 3000 --directory "%ROOT%frontend"
pause
