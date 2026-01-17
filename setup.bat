@echo off
REM 🌕 lunarRepo - Setup Script (Windows)
REM Installs dependencies and sets up development environment

setlocal enabledelayedexpansion

echo 🌕 lunarRepo - Development Setup
echo ==================================

REM Check Python version
echo ✓ Checking Python version...
for /f "tokens=*" %%i in ('python --version 2^>^&1') do set PYTHON_VERSION=%%i
echo   %PYTHON_VERSION%

REM Create virtual environment
echo ✓ Creating virtual environment...
if not exist "venv" (
    python -m venv venv
)
call venv\Scripts\activate.bat

REM Upgrade pip
echo ✓ Upgrading pip...
python -m pip install --upgrade pip

REM Install dependencies
echo ✓ Installing Python dependencies...
pip install -r requirements.txt

REM Set up environment file
echo ✓ Setting up .env file...
if not exist ".env" (
    copy .env.example .env
    echo   Created .env file (please configure it)
)

REM Create necessary directories
echo ✓ Creating directories...
if not exist "logs" mkdir logs
if not exist "build_cache" mkdir build_cache
if not exist ".cache" mkdir .cache

REM Install development tools
echo ✓ Installing development tools...
pip install pytest pytest-cov black flake8 isort mypy

echo.
echo ✅ Setup complete!
echo.
echo 📚 Next steps:
echo    1. Configure .env file with your settings
echo    2. Run 'venv\Scripts\activate.bat' to activate virtual environment
echo    3. Run 'python core\cli.py run' to start development server
echo    4. Run 'uvicorn server.api:app --reload' to start API server
echo.
echo 📖 Documentation:
echo    - Backend: python core\cli.py --help
echo    - API: http://localhost:8000/docs

endlocal
