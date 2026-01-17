@echo off
REM LunarRepo - Device Login & Sync Script
REM Automatically authenticates and pushes code using device login

cd /d "C:\Users\malarmannan.a\YC\LunarRepo"

echo.
echo 🌕 LunarRepo - Device Login & Sync
echo ==================================
echo.

REM Check if Python is available
python --version >nul 2>nul
if %errorlevel% neq 0 (
    echo Trying Python 3...
    py --version >nul 2>nul
    if %errorlevel% neq 0 (
        echo ERROR: Python not found
        echo Please install Python 3 or use push-to-github.ps1
        pause
        exit /b 1
    )
    py device-login-sync.py
) else (
    python device-login-sync.py
)

echo.
echo Press any key to exit...
pause >nul
