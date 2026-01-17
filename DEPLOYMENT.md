# 🌕 lunarRepo - Production Deployment Guide

## Pre-Deployment Checklist

- [ ] All tests passing (>95% coverage)
- [ ] Code review completed
- [ ] Security scan passed (SAST/DAST)
- [ ] Database migrations tested
- [ ] Environment variables configured
- [ ] Monitoring & alerting set up
- [ ] Backup strategy in place
- [ ] Rollback plan documented

## Deployment Strategies

### Blue-Green Deployment
```yaml
# Deploy new version alongside current
# Route traffic only after health checks pass
# Instant rollback if needed
```

### Canary Deployment
```bash
# Deploy to 5% of traffic first
# Monitor for errors/performance issues
# Gradually increase to 100%
```

### Rolling Deployment
```bash
# Update instances one at a time
# Maintain zero downtime
# Automatic rollback on health check failure
```

## GitHub Actions CI/CD Pipeline

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Production

on:
  push:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run tests
        run: |
          pytest tests/ --cov
          npm test

  build:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Build Docker image
        run: docker build -t lunar-repo:${{ github.sha }} .
      - name: Push to registry
        run: |
          aws ecr get-login-password | docker login --username AWS --password-stdin ${{ secrets.AWS_ECR }}
          docker tag lunar-repo:${{ github.sha }} ${{ secrets.AWS_ECR }}/lunar-repo:latest
          docker push ${{ secrets.AWS_ECR }}/lunar-repo:latest

  deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to AWS ECS
        run: |
          aws ecs update-service \
            --cluster lunar-prod \
            --service lunar-api \
            --force-new-deployment
```

## Production Environment Variables

```bash
# .env.production
ENVIRONMENT=production
DEBUG=false
LOG_LEVEL=warning

# Database
DATABASE_URL=postgresql://$DB_USER:$DB_PASSWORD@$DB_HOST:5432/lunar_prod
DATABASE_POOL_SIZE=30
DATABASE_TIMEOUT=30

# Redis
REDIS_URL=redis://$REDIS_HOST:6379/0
REDIS_POOL_SIZE=50

# Security
AUTH_SECRET=$PROD_AUTH_SECRET
JWT_EXPIRY=86400
SESSION_TIMEOUT=3600

# Third-party Services
SENTRY_DSN=$PROD_SENTRY_DSN
DATADOG_API_KEY=$PROD_DATADOG_KEY
AWS_REGION=us-west-2

# Email
SMTP_HOST=smtp.sendgrid.net
SENDGRID_API_KEY=$SENDGRID_KEY

# Feature Flags
ENABLE_ENTERPRISE_FEATURES=true
ENABLE_ANALYTICS=true
```

## Monitoring Setup

### Application Monitoring
```python
# Monitor key metrics
import time
from prometheus_client import Counter, Histogram

build_counter = Counter('builds_total', 'Total builds')
build_duration = Histogram('build_duration_seconds', 'Build duration')

@build_duration.time()
def execute_build():
    build_counter.inc()
    # Build logic
```

### Health Checks
```bash
# Implement health endpoint
GET /health
{
  "status": "healthy",
  "database": "connected",
  "cache": "connected",
  "timestamp": "2026-01-17T12:00:00Z"
}
```

### Alerting Rules
```yaml
# Alert if error rate > 5%
- alert: HighErrorRate
  expr: rate(errors_total[5m]) > 0.05
  for: 5m
  annotations:
    summary: "High error rate detected"

# Alert if latency > 500ms
- alert: HighLatency
  expr: histogram_quantile(0.95, build_duration_seconds) > 0.5
  for: 10m
```

## Disaster Recovery

### RTO & RPO Targets
- **RTO (Recovery Time Objective):** 1 hour
- **RPO (Recovery Point Objective):** 1 hour

### Backup Strategy
```bash
# Daily backups
0 2 * * * pg_dump -h db.prod -U postgres lunar_prod > /backups/lunar_$(date +\%Y\%m\%d).sql

# Archive to S3
aws s3 sync /backups s3://lunar-backups/ --sse AES256

# Test restore weekly
0 3 * * 0 pg_restore -d lunar_test < /backups/latest.sql
```

### Failover Plan
1. Detect failure in monitoring
2. Promote read replica to primary
3. Update DNS to point to new endpoint
4. Verify data integrity
5. Update application configuration
6. Test with canary traffic
7. Full traffic cutover

## Security Hardening

### Infrastructure Security
```bash
# Enable VPC security groups
# Restrict to necessary ports only (443, 5432)

# Enable encryption in transit
# TLS 1.3 required
# Certificate auto-renewal (Let's Encrypt)

# Enable encryption at rest
# Database: AES-256
# S3: SSE-S3
# Secrets: AWS KMS
```

### Application Security
```python
# Rate limiting
from slowapi import Limiter
limiter = Limiter(key_func=get_remote_address)

@app.post("/api/builds")
@limiter.limit("100/minute")
def create_build():
    pass

# Input validation
from pydantic import BaseModel
class BuildRequest(BaseModel):
    name: str = Field(..., max_length=100)
    targets: List[str] = Field(..., max_items=1000)

# SQL injection prevention (use ORM or parameterized queries)
```

### Data Protection
```bash
# GDPR Compliance
# - Implement data export API
# - Implement data deletion API
# - Maintain audit logs

# SOC2 Compliance
# - Document access controls
# - Enable MFA for all staff
# - Encrypt sensitive data
# - Regular security audits
```

## Performance Optimization

### Database Optimization
```sql
-- Add indexes for common queries
CREATE INDEX idx_builds_user_id ON builds(user_id);
CREATE INDEX idx_builds_created_at ON builds(created_at DESC);

-- Analyze query performance
EXPLAIN ANALYZE SELECT * FROM builds WHERE user_id = 123;
```

### Caching Strategy
```python
from functools import lru_cache

@lru_cache(maxsize=1000)
def get_build_config(build_id):
    return db.query(BuildConfig).filter_by(id=build_id).first()

# Invalidate cache on updates
def update_build_config(build_id, config):
    get_build_config.cache_clear()
    db.update(BuildConfig, config)
```

### CDN Setup
```nginx
# CloudFront/Cloudflare configuration
# Cache static assets for 1 year
Cache-Control: max-age=31536000

# Cache API responses for 5 minutes
Cache-Control: max-age=300, public
```

## Cost Optimization

### Infrastructure Costs
- Use spot instances for non-critical workloads (40% savings)
- Auto-scaling based on load
- Reserved instances for baseline capacity
- Right-sizing instance types

### Monitoring Costs
- Log aggregation (5GB/day limit)
- Metrics retention (30 days)
- Trace sampling (10%)

## Post-Deployment

### Verification Steps
```bash
# Health check
curl https://api.lunarrepo.com/health

# Smoke tests
pytest tests/smoke/ --env=production

# Monitor error rate for 30 minutes
# Monitor latency for 30 minutes
# Check database replication lag
```

### Rollback Plan
```bash
# Automatic rollback on high error rate
if error_rate > 0.1:
    aws ecs update-service --cluster lunar-prod --service lunar-api --task-definition lunar:previous
    
# Manual rollback
aws ecs update-service --cluster lunar-prod --service lunar-api --task-definition lunar:v123
```

## Communication & Documentation

### Deployment Announcement
- Notify users of maintenance window
- Update status page
- Post-deployment update on what changed
- Link to release notes

### Documentation
- Document deployment process
- Record any manual steps
- Update runbooks
- Post-mortem on any issues

## Support Contacts

- **On-call Engineer:** escalations@lunarrepo.dev
- **Security Issues:** security@lunarrepo.dev
- **Urgent:** +1-XXX-XXX-XXXX
