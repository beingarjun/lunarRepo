#!/bin/bash

# 🌕 lunarRepo - GitHub Deployment Script
# Pushes code and deploys to cloud platform

set -e

echo "🌕 lunarRepo - Deploying to GitHub..."

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not a git repository"
    exit 1
fi

# Get the current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "📍 Current branch: $BRANCH"

# Check if there are uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo "❌ Error: Uncommitted changes found"
    echo "   Please commit or stash your changes first"
    exit 1
fi

# Run tests
echo "🧪 Running tests..."
pytest tests/ --cov || exit 1

# Run linting
echo "🔍 Running linting..."
flake8 . || true
black --check . || true

# Build Docker image
echo "🐳 Building Docker image..."
docker build -t lunar-repo:$(git rev-parse --short HEAD) . || exit 1
docker tag lunar-repo:$(git rev-parse --short HEAD) lunar-repo:latest

# Push to GitHub
echo "📤 Pushing to GitHub..."
git push origin $BRANCH

# Create git tag for release
if [ "$BRANCH" == "main" ]; then
    VERSION=$(date +%Y.%m.%d)
    echo "🏷️  Creating version tag: $VERSION"
    git tag -a v$VERSION -m "Release version $VERSION"
    git push origin v$VERSION
fi

echo "✅ Deployment complete!"
echo "   - Code pushed to GitHub"
echo "   - Docker image built: lunar-repo:latest"
echo ""
echo "📚 Next steps:"
echo "   - Review PR/commits on GitHub"
echo "   - Deploy to cloud platform (Railway, Render, Vercel)"
echo "   - Run smoke tests in production"
