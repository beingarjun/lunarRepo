# LunarRepo - Push to GitHub Script
# This script creates the repository on GitHub and pushes all code

param(
    [string]$Token = "",  # Set via gh auth or environment variable
    [string]$Owner = "beingarjun",
    [string]$RepoName = "lunarRepo"
)

Write-Host "🌕 LunarRepo - GitHub Push Script" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Check if repository exists
Write-Host "Step 1: Checking if repository exists..." -ForegroundColor Yellow
$repoUrl = "https://api.github.com/repos/$Owner/$RepoName"
$repoExists = $false

try {
    $response = Invoke-WebRequest -Uri $repoUrl -ErrorAction Stop
    $repoExists = $true
    Write-Host "✓ Repository already exists" -ForegroundColor Green
} catch {
    Write-Host "ℹ Repository does not exist yet, will create it" -ForegroundColor Blue
}

# Step 2: Create repository if it doesn't exist
if (-not $repoExists) {
    Write-Host ""
    Write-Host "Step 2: Creating repository on GitHub..." -ForegroundColor Yellow
    
    $body = @{
        name = $RepoName
        description = "Explainable · Observable · Deterministic build & task orchestration"
        private = $false
        auto_init = $false
    } | ConvertTo-Json

    try {
        $headers = @{
            "Authorization" = "token $Token"
            "Accept" = "application/vnd.github.v3+json"
        }
        
        $response = Invoke-WebRequest -Uri "https://api.github.com/user/repos" `
            -Method POST `
            -Headers $headers `
            -Body $body `
            -ContentType "application/json" `
            -ErrorAction Stop
        
        Write-Host "✓ Repository created successfully" -ForegroundColor Green
    } catch {
        Write-Host "✗ Failed to create repository: $_" -ForegroundColor Red
        exit 1
    }
}

# Step 3: Configure git remote
Write-Host ""
Write-Host "Step 3: Configuring git remote..." -ForegroundColor Yellow
$remoteUrl = "https://$Owner`:$Token@github.com/$Owner/$RepoName.git"

try {
    Push-Location "C:\Users\malarmannan.a\YC\LunarRepo"
    
    # Check current remote
    $currentRemote = git remote get-url origin 2>$null
    if ($currentRemote) {
        git remote remove origin
        Write-Host "✓ Removed existing remote" -ForegroundColor Green
    }
    
    git remote add origin $remoteUrl
    Write-Host "✓ Remote configured" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to configure remote: $_" -ForegroundColor Red
    exit 1
}

# Step 4: Push to GitHub
Write-Host ""
Write-Host "Step 4: Pushing code to GitHub..." -ForegroundColor Yellow

try {
    git push -u origin main
    Write-Host "✓ Code pushed successfully" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to push: $_" -ForegroundColor Red
    exit 1
} finally {
    Pop-Location
}

# Success!
Write-Host ""
Write-Host "✅ LunarRepo Successfully Pushed!" -ForegroundColor Green
Write-Host "Repository: https://github.com/$Owner/$RepoName" -ForegroundColor Cyan
Write-Host ""
