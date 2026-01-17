@echo off
REM GitHub Device Login - Simple Batch Wrapper

cd /d "C:\Users\malarmannan.a\YC\LunarRepo"

echo.
echo 🌕 GitHub Device Login Guide
echo =============================
echo.

python github-device-login.py

echo.
echo =============================
echo.
echo Once authenticated, run:
echo   git push -u origin main
echo.
pause
