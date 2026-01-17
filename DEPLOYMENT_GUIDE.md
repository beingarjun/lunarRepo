# 🌕 lunarRepo - Deployment Guide

## Prerequisites

- Docker & Docker Compose
- Python 3.11+
- Node.js 18+
- PostgreSQL 13+
- Redis 6+

## Local Development Setup

### 1. Clone Repository
```bash
git clone https://github.com/beingarjun/lunarRepo.git
cd lunarRepo
```

### 2. Environment Setup
```bash
cp .env.example .env
# Edit .env with your configuration
```

### 3. Install Dependencies
```bash
# Backend
pip install -r requirements.txt

# Frontend (if applicable)
npm install
```

### 4. Start Development Server
```bash
# Using Docker Compose
docker-compose up -d

# Or manually
python core/cli.py run
uvicorn server.api:app --reload
```

## Docker Deployment

### Build Docker Image
```bash
docker build -t lunar-repo:latest .
```

### Run Container
```bash
docker run -p 8000:8000 \
  -e DATABASE_URL=postgresql://user:pass@db:5432/lunar \
  -e REDIS_URL=redis://cache:6379 \
  lunar-repo:latest
```

### Docker Compose (Production)
```yaml
version: '3.8'
services:
  api:
    build: .
    ports:
      - "8000:8000"
    environment:
      DATABASE_URL: postgresql://user:pass@db:5432/lunar
      REDIS_URL: redis://cache:6379
    depends_on:
      - db
      - cache
  
  db:
    image: postgres:13-alpine
    environment:
      POSTGRES_DB: lunar
      POSTGRES_PASSWORD: securepassword
    volumes:
      - postgres_data:/var/lib/postgresql/data
  
  cache:
    image: redis:6-alpine
    ports:
      - "6379:6379"

volumes:
  postgres_data:
```

## Cloud Deployment

### Vercel (Frontend)
```bash
# Deploy with Vercel CLI
vercel deploy

# Or connect GitHub repo directly via vercel.json
```

### Railway
```bash
# Install Railway CLI
railway login

# Deploy
railway deploy
```

### Render
```bash
# Use render.yaml configuration
# Connect GitHub repo to Render dashboard
# Auto-deploy on push to main
```

### AWS ECS
```bash
# Push to ECR
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin <account-id>.dkr.ecr.us-west-2.amazonaws.com
docker tag lunar-repo:latest <account-id>.dkr.ecr.us-west-2.amazonaws.com/lunar-repo:latest
docker push <account-id>.dkr.ecr.us-west-2.amazonaws.com/lunar-repo:latest

# Deploy with ECS task
aws ecs create-service --cluster lunar-cluster --service-name lunar-api --task-definition lunar-task:1
```

## Database Migrations

```bash
# Run migrations
python -m alembic upgrade head

# Create new migration
python -m alembic revision --autogenerate -m "Add column"
```

## Authentication Setup

### Google OAuth
1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Create new project
3. Enable Google+ API
4. Create OAuth 2.0 credentials (Web Application)
5. Add authorized redirect URIs:
   - `http://localhost:3000/auth/callback`
   - `https://yourdomain.com/auth/callback`
6. Copy credentials to `.env`:
   ```
   GOOGLE_CLIENT_ID=...
   GOOGLE_CLIENT_SECRET=...
   ```

### Microsoft OAuth
1. Register app in [Azure Portal](https://portal.azure.com)
2. Create client secret
3. Add redirect URIs
4. Configure in `.env`:
   ```
   MICROSOFT_CLIENT_ID=...
   MICROSOFT_CLIENT_SECRET=...
   ```

## Security Checklist

- [ ] Change all default passwords
- [ ] Enable HTTPS/TLS
- [ ] Configure firewall rules
- [ ] Set up SSH key access (disable password)
- [ ] Enable database encryption
- [ ] Configure backup strategy
- [ ] Set up monitoring & alerting
- [ ] Enable audit logging
- [ ] Configure API rate limiting
- [ ] Set up DDoS protection

## Monitoring & Logging

### Sentry (Error Tracking)
```python
# Configure in code
import sentry_sdk
sentry_sdk.init(
    dsn=os.getenv("SENTRY_DSN"),
    traces_sample_rate=1.0
)
```

### Datadog (APM & Monitoring)
```bash
# Install Datadog agent
DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=<key> DD_SITE=datadoghq.com bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_mac_os.sh)"
```

### CloudWatch (AWS)
```bash
# Logs automatically shipped from ECS containers
# Configure in CloudWatch dashboard
```

## Scaling Considerations

### Horizontal Scaling
- Use load balancer (ALB, NLB, or Nginx)
- Deploy multiple API instances
- Use managed database (RDS, Cloud SQL)
- Use managed cache (ElastiCache, Cloud Memorystore)

### Performance Optimization
- Enable database connection pooling
- Implement caching strategy
- Use CDN for static assets
- Enable gzip compression
- Optimize database queries

## Troubleshooting

### Issue: Connection timeout
```bash
# Check service health
docker ps
docker logs <container-id>
# Check firewall rules
```

### Issue: Database migration failures
```bash
# Rollback
alembic downgrade -1

# Check migration status
alembic current
```

### Issue: Memory leaks
```bash
# Monitor memory usage
docker stats

# Enable profiling
py-spy record -o profile.svg -- python core/cli.py run
```

## Backup & Recovery

### Database Backup
```bash
# Backup PostgreSQL
pg_dump -h localhost -U postgres lunar > backup.sql

# Restore from backup
psql -h localhost -U postgres lunar < backup.sql
```

### Application Backup
```bash
# Backup entire application
tar -czf lunar-repo-backup.tar.gz lunar-repo/

# Restore
tar -xzf lunar-repo-backup.tar.gz
```

## Support & Resources

- **Documentation:** https://github.com/beingarjun/lunarRepo/wiki
- **Issues:** https://github.com/beingarjun/lunarRepo/issues
- **Discussions:** https://github.com/beingarjun/lunarRepo/discussions
- **Slack Community:** [Join our Slack](https://slack.lunarrepo.dev)
