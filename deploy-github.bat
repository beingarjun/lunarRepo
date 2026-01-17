@echo off
REM 🌕 lunarRepo - GitHub Deployment Script (Windows)
REM Pushes code and deploys to cloud platform

setlocal enabledelayedexpansion

echo 🌕 lunarRepo - Deploying to GitHub...

REM Check if we're in a git repository
if not exist ".git" (
    echo ❌ Error: Not a git repository
    exit /b 1
)

REM Get the current branch
for /f "tokens=*" %%i in ('git rev-parse --abbrev-ref HEAD') do set BRANCH=%%i
echo 📍 Current branch: %BRANCH%

REM Check for uncommitted changes
git diff-index --quiet HEAD --
if errorlevel 1 (
    echo ❌ Error: Uncommitted changes found
    echo    Please commit or stash your changes first
    exit /b 1
)

REM Run tests
echo 🧪 Running tests...
pytest tests/ --cov
if errorlevel 1 exit /b 1

REM Run linting
echo 🔍 Running linting...
flake8 .
black --check .

REM Build Docker image
echo 🐳 Building Docker image...
for /f "tokens=*" %%i in ('git rev-parse --short HEAD') do set COMMIT=%%i
docker build -t lunar-repo:%COMMIT% .
if errorlevel 1 exit /b 1
docker tag lunar-repo:%COMMIT% lunar-repo:latest

REM Push to GitHub
echo 📤 Pushing to GitHub...
git push origin %BRANCH%
if errorlevel 1 exit /b 1

REM Create git tag for release
if "%BRANCH%"=="main" (
    for /f "tokens=*" %%i in ('powershell -Command "Get-Date -Format 'yyyy.MM.dd'"') do set VERSION=%%i
    echo 🏷️  Creating version tag: %VERSION%
    git tag -a v%VERSION% -m "Release version %VERSION%"
    git push origin v%VERSION%
)

echo ✅ Deployment complete!
echo    - Code pushed to GitHub
echo    - Docker image built: lunar-repo:latest
echo.
echo 📚 Next steps:
echo    - Review PR/commits on GitHub
echo    - Deploy to cloud platform (Railway, Render, Vercel)
echo    - Run smoke tests in production

endlocal
