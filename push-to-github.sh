#!/bin/bash

# LunarRepo - Push to GitHub Script (Bash)
# Usage: bash push-to-github.sh

TOKEN=""  # Set via gh auth or environment variable
OWNER="beingarjun"
REPO="lunarRepo"
REPO_PATH="$HOME/YC/LunarRepo"

echo "🌕 LunarRepo - GitHub Push Script"
echo "=================================="
echo ""

# Step 1: Check if repository exists
echo "Step 1: Checking if repository exists..."
REPO_URL="https://api.github.com/repos/$OWNER/$REPO"

if curl -s -f -o /dev/null -w "%{http_code}" "$REPO_URL" | grep -q "200"; then
    echo "✓ Repository already exists"
    REPO_EXISTS=1
else
    echo "ℹ Repository does not exist yet, will create it"
    REPO_EXISTS=0
fi

# Step 2: Create repository if it doesn't exist
if [ $REPO_EXISTS -eq 0 ]; then
    echo ""
    echo "Step 2: Creating repository on GitHub..."
    
    RESPONSE=$(curl -s -X POST \
        -H "Authorization: token $TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        -d '{
            "name": "'$REPO'",
            "description": "Explainable · Observable · Deterministic build & task orchestration",
            "private": false,
            "auto_init": false
        }' \
        https://api.github.com/user/repos)
    
    if echo "$RESPONSE" | grep -q '"id"'; then
        echo "✓ Repository created successfully"
    else
        echo "✗ Failed to create repository"
        echo "$RESPONSE"
        exit 1
    fi
fi

# Step 3: Configure git remote
echo ""
echo "Step 3: Configuring git remote..."
cd "$REPO_PATH" || exit 1

REMOTE_URL="https://$OWNER:$TOKEN@github.com/$OWNER/$REPO.git"

# Remove existing remote if present
if git remote get-url origin &>/dev/null; then
    git remote remove origin
    echo "✓ Removed existing remote"
fi

git remote add origin "$REMOTE_URL"
echo "✓ Remote configured"

# Step 4: Push to GitHub
echo ""
echo "Step 4: Pushing code to GitHub..."

if git push -u origin main; then
    echo "✓ Code pushed successfully"
else
    echo "✗ Failed to push"
    exit 1
fi

# Success!
echo ""
echo "✅ LunarRepo Successfully Pushed!"
echo "Repository: https://github.com/$OWNER/$REPO"
echo ""
