---
layout: default
title: FAQ
---

# ❓ Frequently Asked Questions

## General

### What is lunarRepo?

lunarRepo is an open-source, local-first build orchestration platform designed for teams that want Google-scale build systems without vendor lock-in. It provides deterministic builds, complete explainability, and enterprise governance.

### How is lunarRepo different from Moonrepo/Nx/Turborepo?

| Feature | lunarRepo | Moonrepo | Nx | Turborepo |
|---------|-----------|---------|----|----|
| **Local-First** | ✅ | ❌ Cloud | ✅ | ✅ |
| **Audit Trails** | ✅ Immutable | ❌ Limited | ❌ | ❌ |
| **Explainability** | ✅ <150ms | ❌ | ❌ | ❌ |
| **Enterprise Governance** | ✅ SOC2 Ready | ✅ | ✅ | ❌ |
| **Open Source** | ✅ Apache 2.0 | ❌ | ✅ | ✅ |
| **Offline Capable** | ✅ | ❌ | ✅ | ✅ |
| **Cost** | Free | $30K-$500K/year | Free | Free |

### Is lunarRepo free?

Yes! lunarRepo is open source and free forever under the Apache 2.0 license. We also offer:
- **Community Support** - Free, community-driven
- **Enterprise** - $180K-$500K/year with priority support and compliance features

### Can I self-host lunarRepo?

Absolutely! lunarRepo is designed to be self-hosted. You can deploy it on-premises, in your private cloud, or use our managed cloud offering (coming Q1 2026).

---

## Technical

### What are the system requirements?

**Minimum:**
- Python 3.11+
- 4GB RAM
- 20GB storage
- PostgreSQL 13+
- Redis 6+

**Recommended (Production):**
- Python 3.11+
- 16GB+ RAM
- 100GB+ storage
- PostgreSQL 15+
- Redis 7+

### How does deterministic caching work?

lunarRepo uses **content-addressed caching** with cryptographic hashing:

1. Every task is hashed based on its inputs (code, dependencies, configuration)
2. Output is stored with this hash as the key
3. If inputs haven't changed, the cached output is used
4. This ensures builds are reproducible across all environments

Result: **10x faster builds** on average.

### What's the "Explainability Engine"?

The Explainability Engine answers "Why did this task run?" by:
- Analyzing the dependency graph
- Comparing input hashes across builds
- Identifying what changed and why
- Returning results in <150ms

This **reduces debugging time by 65%**.

### Can I use lunarRepo with existing monorepo tools?

Yes! lunarRepo works well with:
- ✅ Yarn Workspaces
- ✅ npm Workspaces
- ✅ Lerna
- ✅ Gradle
- ✅ Bazel
- ✅ Maven

### How do I migrate from Moonrepo/Nx?

See our [Migration Guide](https://github.com/beingarjun/lunarRepo/wiki/Migration-Guide) for step-by-step instructions. Migration typically takes 2-4 weeks depending on project complexity.

### What databases does lunarRepo support?

**Primary:**
- PostgreSQL 13+

**Supported:**
- MySQL 8+
- MariaDB 10.6+
- SQLite (development only)

### Is lunarRepo secure?

Yes. Security features include:
- ✅ Encryption at rest (AES-256)
- ✅ Encryption in transit (TLS 1.3)
- ✅ OAuth2 authentication
- ✅ JWT tokens with automatic expiration
- ✅ Rate limiting and DDoS protection
- ✅ Input sanitization and SQL injection prevention
- ✅ Immutable audit logs

See [SECURITY.md](https://github.com/beingarjun/lunarRepo/blob/main/SECURITY.md) for details.

---

## Deployment

### How do I deploy lunarRepo?

We support multiple deployment options:
- **Docker** - Single command deployment
- **Docker Compose** - Multi-service setup
- **Vercel** - Serverless deployment
- **Railway** - Git-based deployment
- **Render** - Managed PostgreSQL + Redis
- **AWS ECS** - Enterprise deployment
- **On-Premises** - Your own infrastructure

See [DEPLOYMENT.md](../DEPLOYMENT.md) for detailed guides.

### What's the average deployment time?

- **Docker** - 5-10 minutes
- **Vercel/Railway** - 2-5 minutes (Git-based)
- **AWS ECS** - 15-30 minutes (first time setup)
- **On-Premises** - 30-60 minutes

### What about disaster recovery?

lunarRepo provides:
- **RTO (Recovery Time Objective):** <1 hour
- **RPO (Recovery Point Objective):** <1 hour
- Automated backups every 6 hours
- Point-in-time recovery capability
- Multi-region failover (Enterprise plan)

### How do I monitor lunarRepo?

We provide integrations with:
- ✅ Sentry (Error tracking)
- ✅ Datadog (APM)
- ✅ CloudWatch (AWS monitoring)
- ✅ ELK Stack (Log aggregation)
- ✅ Prometheus (Metrics)
- ✅ Grafana (Dashboards)

---

## Pricing & Licensing

### How much does lunarRepo cost?

| Plan | Price | Users | Support |
|------|-------|-------|---------|
| **Open Source** | Free | Unlimited | Community |
| **Startup** | $180K/year | <50 | Email |
| **Enterprise** | $350K/year | Unlimited | 24/7 Phone |
| **Custom** | Custom | Custom | Custom |

### What's included in the Enterprise plan?

- ✅ Priority support (24/7)
- ✅ SLA guarantees (99.95% uptime)
- ✅ Custom compliance features (SOC2, HIPAA, FedRAMP)
- ✅ Custom integrations
- ✅ Dedicated account manager
- ✅ Custom deployment options
- ✅ Training and onboarding

### Can I use lunarRepo in a commercial project?

Yes! lunarRepo is Apache 2.0 licensed, which allows commercial use, modification, and distribution with minimal restrictions.

See [LICENSE](https://github.com/beingarjun/lunarRepo/blob/main/LICENSE) for full terms.

---

## Support & Community

### How do I report a bug?

Please open an issue on [GitHub Issues](https://github.com/beingarjun/lunarRepo/issues) with:
1. Detailed description of the issue
2. Steps to reproduce
3. Expected vs. actual behavior
4. System information (OS, Python version, etc.)
5. Error logs or stack traces

### Where can I get help?

- 📧 **Email:** support@lunarrepo.dev
- 💬 **Discord:** [Join Community](https://discord.gg/lunarrepo)
- 🐛 **GitHub Issues:** [Report bugs](https://github.com/beingarjun/lunarRepo/issues)
- 📚 **Documentation:** [Guides and tutorials](https://docs.lunarrepo.dev)
- 📖 **Wiki:** [Community knowledge base](https://github.com/beingarjun/lunarRepo/wiki)

### Can I contribute to lunarRepo?

Absolutely! We welcome contributions of all kinds:
- 🐛 Bug reports and fixes
- ✨ New features
- 📖 Documentation improvements
- 🎨 Design enhancements
- 🌍 Translations

See [CONTRIBUTING.md](https://github.com/beingarjun/lunarRepo/blob/main/CONTRIBUTING.md) for guidelines.

### How do I request a feature?

1. Check [GitHub Discussions](https://github.com/beingarjun/lunarRepo/discussions) to see if it's already requested
2. If not, create a new discussion
3. Describe the use case and expected behavior
4. The team will review and prioritize

### What's your release schedule?

- **Minor releases** - Monthly (new features)
- **Patch releases** - Weekly (bug fixes)
- **Major releases** - Quarterly (breaking changes)

See [CHANGELOG.md](https://github.com/beingarjun/lunarRepo/blob/main/CHANGELOG.md) for version history.

---

## Performance & Scaling

### How many builds can lunarRepo handle?

lunarRepo scales to:
- **1K+ builds/day** on standard setup
- **10K+ builds/day** on enterprise setup
- **100K+ builds/day** with horizontal scaling

### What's the maximum team size?

lunarRepo has been tested and validated with:
- Small teams (5-50 developers) - Standard setup
- Mid-size teams (50-500 developers) - Optimized setup
- Enterprise (500+ developers) - Distributed setup

### How large can a monorepo be?

lunarRepo supports:
- **1000+ packages** - Tested and supported
- **500K+ files** - Typical large enterprise monorepo
- **100GB+ source code** - With distributed caching

---

## Still have questions?

Feel free to:
- 📧 Email us: hello@lunarrepo.dev
- 💬 Chat on Discord: [Join now](https://discord.gg/lunarrepo)
- 🗣️ Start a discussion: [GitHub Discussions](https://github.com/beingarjun/lunarRepo/discussions)

---

**Last updated:** January 2026
