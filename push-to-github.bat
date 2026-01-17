@echo off
REM LunarRepo - Push to GitHub Script (Batch Wrapper)
REM Run this from Command Prompt or PowerShell

echo.
echo 🌕 LunarRepo - Push to GitHub
echo ===============================
echo.

REM Check if PowerShell is available
where pwsh >nul 2>nul
if %errorlevel% equ 0 (
    echo Running PowerShell Core...
    pwsh -ExecutionPolicy Bypass -File "%~dp0push-to-github.ps1"
) else (
    where powershell >nul 2>nul
    if %errorlevel% equ 0 (
        echo Running PowerShell Desktop...
        powershell -ExecutionPolicy Bypass -File "%~dp0push-to-github.ps1"
    ) else (
        echo ERROR: PowerShell not found
        exit /b 1
    )
)

pause
