---
layout: default
title: Getting Started
---

# 🚀 Getting Started with lunarRepo

**LUNAR** = **L**ocal-first **U**niversal **N**ative **A**udit-ready **R**epository and task orchestration

## Why lunarRepo vs Other Tools?

Unlike Moonrepo — which builds tooling for multi-project codebases with cloud-first monorepo automation — lunarRepo is **local-first, deterministic, and governance-ready**:

- ✅ **No cloud lock-in** - Run fully locally or on-premises
- ✅ **Deterministic by design** - 100% reproducible builds every time
- ✅ **Immutable audit trails** - Full compliance for regulated industries
- ✅ **Open-source** - Community-driven, no vendor lock-in
- ✅ **Explainability built-in** - Instant answers to "why did this run?"

## Prerequisites

Before you begin, ensure you have the following installed:

- **Python 3.11 or higher**
- **Git** (for cloning the repository)
- **Docker & Docker Compose** (optional, for containerized setup)
- **PostgreSQL 13+** (for production deployments)
- **Redis 6+** (for caching layer)

## Installation

### Option 1: Local Development (Recommended)

#### macOS / Linux

```bash
# Clone the repository
git clone https://github.com/beingarjun/lunarRepo.git
cd lunarRepo

# Run setup script
bash setup.sh

# Activate virtual environment
source venv/bin/activate

# Start development server
uvicorn server.api:app --reload
```

#### Windows

```cmd
# Clone the repository
git clone https://github.com/beingarjun/lunarRepo.git
cd lunarRepo

# Run setup script
setup.bat

# Activate virtual environment
venv\Scripts\activate.bat

# Start development server
uvicorn server.api:app --reload
```

### Option 2: Docker

```bash
# Build Docker image
docker build -t lunar-repo:latest .

# Run container
docker run -p 8000:8000 -e DATABASE_URL=postgresql://... lunar-repo:latest
```

### Option 3: Docker Compose

```bash
# Start all services (API, PostgreSQL, Redis)
docker-compose up -d

# Stop services
docker-compose down
```

## First Steps

### 1. Access the API

Open your browser and navigate to:
```
http://localhost:8000/docs
```

This opens the interactive API documentation powered by Swagger UI.

### 2. Initialize Your First Project

```bash
# Using the CLI
python core/cli.py init my-project

# Configure build system
cd my-project
lunar configure
```

### 3. Run Your First Build

```bash
# Execute build
lunar run build

# View build cache and performance
lunar explain
```

## Project Structure

```
lunarRepo/
├── core/
│   ├── cli.py              # Command-line interface
│   ├── executor.py         # Build execution engine
│   ├── cache.py            # Caching layer
│   ├── graph.py            # Dependency graph analysis
│   └── explain.py          # Explainability engine
├── server/
│   ├── api.py              # FastAPI application
│   ├── models.py           # Database models
│   ├── routers/            # API route handlers
│   └── auth.py             # Authentication
├── storage/
│   ├── db.py               # Database connection
│   └── migrations/         # Database migrations
├── ci/
│   └── workflows/          # GitHub Actions workflows
├── tests/                  # Test suite
└── docs/                   # Documentation
```

## Environment Configuration

Create a `.env` file in the root directory:

```env
# Database
DATABASE_URL=postgresql://user:password@localhost:5432/lunar_db

# Redis Cache
REDIS_URL=redis://localhost:6379/0

# API Settings
SECRET_KEY=your-secret-key-here
DEBUG=true

# OAuth (Optional)
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret

# Monitoring (Optional)
SENTRY_DSN=your-sentry-dsn
```

## Running Tests

```bash
# Install test dependencies
pip install pytest pytest-cov pytest-asyncio

# Run all tests
pytest tests/ -v

# Run with coverage
pytest tests/ --cov=. --cov-report=html

# Run specific test file
pytest tests/test_cache.py -v
```

## Common Commands

### CLI Commands

```bash
# Initialize project
lunar init <project-name>

# Configure build system
lunar configure

# Run build
lunar run build

# Execute specific task
lunar run task-name

# Clear cache
lunar cache clear

# View cache status
lunar cache status

# Get build explanation
lunar explain <build-id>

# List all builds
lunar history
```

### API Commands

```bash
# Create build
curl -X POST http://localhost:8000/api/builds \
  -H "Content-Type: application/json" \
  -d '{"project": "my-project", "config": {...}}'

# Get build status
curl http://localhost:8000/api/builds/{build_id}

# Get build logs
curl http://localhost:8000/api/builds/{build_id}/logs

# Explain build
curl http://localhost:8000/api/builds/{build_id}/explain
```

## Troubleshooting

### Issue: Connection to PostgreSQL Failed

**Solution:**
```bash
# Check if PostgreSQL is running
brew services list  # macOS
systemctl status postgresql  # Linux

# Verify DATABASE_URL in .env
# Format: postgresql://user:password@host:port/database
```

### Issue: Redis Connection Error

**Solution:**
```bash
# Check if Redis is running
redis-cli ping

# Start Redis
brew services start redis  # macOS
redis-server  # Linux/macOS
```

### Issue: Port 8000 Already in Use

**Solution:**
```bash
# Use different port
uvicorn server.api:app --port 8001

# Or kill existing process
lsof -ti:8000 | xargs kill -9
```

### Issue: Virtual Environment Not Activating

**Solution:**
```bash
# macOS/Linux
source venv/bin/activate

# Windows PowerShell
venv\Scripts\Activate.ps1

# Windows CMD
venv\Scripts\activate.bat
```

## Next Steps

- 📖 Read the [Deployment Guide](../DEPLOYMENT_GUIDE.md) to deploy to production
- 💼 Check the [Business Plan](../BUSINESS_PLAN.md) for market insights
- 🎬 View the [Pitch Deck](../pitch-deck.html) for company overview
- ☁️ Learn about [Lunar Cloud](../docs/faq.md#what-is-lunar-cloud) (launching 2027)
- 👥 Join our [Discord Community](https://discord.gg/lunarrepo)
- 🤝 Start [Contributing](https://github.com/beingarjun/lunarRepo/blob/main/CONTRIBUTING.md)

## Cloud Features (Lunar Cloud - Launching 2027)

Lunar Cloud is an optional managed service that complements your self-hosted lunarRepo instance:

**Features:**
- **Distributed Cache Network** - Global cache distribution for teams across multiple regions
- **Team Insights Dashboard** - Repository analytics, dependency patterns, build trends
- **Remote Execution** - Run builds and tests on geo-distributed infrastructure
- **No Vendor Lock-in** - Your data stays yours; easy export anytime

**Pricing:**
- **Free** - Open-source projects and community teams
- **Team Plan** ($200/month) - Up to 20 engineers, shared cache, team insights
- **Enterprise Plan** ($500/month) - Unlimited users, advanced analytics, custom features

For details, see [Lunar Cloud FAQ](../docs/faq.md#what-is-lunar-cloud).

## Need Help?

- 📧 Email: support@lunarrepo.dev
- 💬 Discord: [Join Community](https://discord.gg/lunarrepo)
- 🐛 Issues: [GitHub Issues](https://github.com/beingarjun/lunarRepo/issues)
- 📚 Wiki: [GitHub Wiki](https://github.com/beingarjun/lunarRepo/wiki)

---

**Ready to get started? Clone the repo and run `bash setup.sh` (or `setup.bat` on Windows)!**
