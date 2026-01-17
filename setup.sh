#!/bin/bash

# 🌕 lunarRepo - Setup Script (macOS/Linux)
# Installs dependencies and sets up development environment

set -e

echo "🌕 lunarRepo - Development Setup"
echo "=================================="

# Check Python version
echo "✓ Checking Python version..."
PYTHON_VERSION=$(python3 --version | grep -oP '\d+\.\d+')
if (( $(echo "$PYTHON_VERSION < 3.11" | bc -l) )); then
    echo "❌ Python 3.11+ required (found $PYTHON_VERSION)"
    exit 1
fi
echo "  Python $PYTHON_VERSION OK"

# Create virtual environment
echo "✓ Creating virtual environment..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate

# Upgrade pip
echo "✓ Upgrading pip..."
pip install --upgrade pip

# Install dependencies
echo "✓ Installing Python dependencies..."
pip install -r requirements.txt

# Set up environment file
echo "✓ Setting up .env file..."
if [ ! -f ".env" ]; then
    cp .env.example .env
    echo "  Created .env file (please configure it)"
fi

# Create necessary directories
echo "✓ Creating directories..."
mkdir -p logs
mkdir -p build_cache
mkdir -p .cache

# Set up pre-commit hooks
echo "✓ Setting up git hooks..."
if [ -f ".git/hooks/pre-commit" ]; then
    rm .git/hooks/pre-commit
fi
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
python -m pytest tests/ --cov || exit 1
EOF
chmod +x .git/hooks/pre-commit

# Install development tools
echo "✓ Installing development tools..."
pip install pytest pytest-cov black flake8 isort mypy

echo ""
echo "✅ Setup complete!"
echo ""
echo "📚 Next steps:"
echo "   1. Configure .env file with your settings"
echo "   2. Run 'source venv/bin/activate' to activate virtual environment"
echo "   3. Run 'python core/cli.py run' to start development server"
echo "   4. Run 'uvicorn server.api:app --reload' to start API server"
echo ""
echo "📖 Documentation:"
echo "   - Backend: python core/cli.py --help"
echo "   - API: http://localhost:8000/docs"
