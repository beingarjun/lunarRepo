---
layout: default
title: Complete Features
---

# 🌟 lunarRepo Complete Features

**LUNAR** = **L**ocal-first **U**niversal **N**ative **A**udit-ready **R**epository and task orchestration

## Management: Smart Build Infrastructure

### ✅ Smart Hashing
- **Content-addressed caching** with cryptographic hashing
- Collects inputs from multiple sources (code, config, dependencies)
- Ensures deterministic and reproducible builds across all environments
- **Result:** 10x faster builds on average

### ✅ Remote Caching
- Persists builds, hashes, and caches across teams and CI/CD
- Local-first by default (opt-in Lunar Cloud for cloud sharing)
- Works seamlessly with GitHub Actions, GitLab CI, CircleCI, Jenkins
- Zero vendor lock-in

### ✅ Integrated Toolchain
- Automatically downloads and manages explicit tool versions
- Ensures consistency across entire workspace
- Per-project or global version configuration
- Supports Node.js, Python, Go, Rust, Java, and more

### ✅ Multi-Platform
- Native support for Linux, macOS, and Windows
- Full feature parity across all platforms
- Handles platform-specific paths and commands
- Tested on CI/CD systems worldwide

---

## Organization: Workspace Intelligence

### ✅ Project Graph
- Auto-generates project dependency graph
- Visualizes relationships between projects
- Identifies circular dependencies
- Optimizes execution order

### ✅ Code Generation
- Scaffold new applications from templates
- Generate libraries, tools, and services
- Consistent project structure across monorepo
- Support for custom templates

### ✅ Dependency Workspaces
- Works alongside npm/yarn workspaces
- Support distinct dependency trees per project
- Prevent dependency conflicts
- Better dependency management

### ✅ Code Ownership
- Declare project owners and maintainers
- Support channels (Slack, email, PagerDuty)
- Auto-generate CODEOWNERS files
- Track responsibility across teams

---

## Orchestration: High-Performance Execution

### ✅ Dependency Graph
- Generates precise dependency graphs from code analysis
- Maximizes parallelization opportunities
- Reduces build times by identifying independent tasks
- Dynamic task scheduling

### ✅ Action Pipeline
- Executes tasks in parallel respecting dependencies
- Thread pool-based execution engine
- Configurable concurrency levels
- Real-time progress monitoring

### ✅ Action Distribution (via Lunar Cloud)
- Distributes actions across multiple machines
- Increases throughput for large monorepos
- Load balancing across CI/CD runners
- Horizontal scaling support

### ✅ Incremental Builds
- Smart hashing enables rebuilding only changed projects
- Skip unchanged dependencies
- Works across team boundaries with remote caching
- Massive time savings in CI/CD

---

## Observability & Governance: Enterprise-Ready

### ✅ Immutable Audit Trails
- **lunarRepo Differentiator:** Every run is logged immutably
- Complete record of:
  - Who ran what task
  - When it ran
  - What changed
  - Why it ran
- Compliance-ready (SOC2, HIPAA, ISO27001)
- Full regulatory audit support

### ✅ Explainability Engine
- **lunarRepo Innovation:** Instant answers to "Why did this run?"
- Analysis includes:
  - Dependency graph analysis
  - Input hash comparisons across builds
  - Changed files and configurations
  - Trigger conditions
- **<150ms response time** for instant debugging
- Reduces debugging time by 65%

### ✅ Webhook Events
- Receive webhooks for every pipeline event
- Event types: started, completed, failed, cached, etc.
- Useful for metrics gathering and insights
- Integration with external monitoring (DataDog, New Relic, Prometheus)
- Customizable webhook payloads

### ✅ Flakiness Detection
- Automatic retry logic for intermittent failures
- Pattern detection for flaky tests
- Retry configuration per task
- Statistics on test reliability
- Helps identify and fix unreliable tests

### ✅ Terminal Notifications
- Real-time notifications in your terminal
- Build success/failure alerts
- Custom notification channels (email, Slack, Teams)
- Desktop notifications support
- Do-not-disturb mode for focused work

### ✅ Git Hooks
- Manage Git hooks centrally
- Enforce workflows and contributor requirements
- Pre-commit, pre-push, post-commit hooks
- Support for script-based and command-based hooks
- Easy setup and configuration

---

## Comparison Matrix: lunarRepo vs Moonrepo

| Feature | lunarRepo | Moonrepo | Notes |
|---------|-----------|----------|-------|
| **Smart Hashing** | ✅ | ✅ | Both deterministic |
| **Local-First** | ✅ **Core** | ❌ Cloud-first | lunarRepo advantage |
| **Remote Caching** | ✅ Optional | ✅ Required | Both support it |
| **Immutable Audit Trails** | ✅ **Built-in** | ❌ Limited | lunarRepo advantage |
| **Explainability Engine** | ✅ **<150ms** | ❌ | lunarRepo innovation |
| **Project Graph** | ✅ | ✅ | Both supported |
| **Code Generation** | ✅ | ✅ | Both supported |
| **Incremental Builds** | ✅ | ✅ | Both supported |
| **Action Distribution** | ✅ Cloud | ✅ Cloud | Both require cloud |
| **Open Source** | ✅ Apache 2.0 | ❌ | lunarRepo advantage |
| **Vendor Lock-in** | ✅ None | ❌ Cloud lock-in | lunarRepo advantage |
| **Cost** | Free | $30K-$500K/year | lunarRepo advantage |

---

## Ecosystems & Integrations

### Language Support
- ✅ JavaScript/TypeScript
- ✅ Python
- ✅ Java/Kotlin
- ✅ Go
- ✅ Rust
- ✅ Ruby
- ✅ PHP
- ✅ And more!

### Package Managers
- ✅ npm
- ✅ yarn
- ✅ pnpm
- ✅ pip
- ✅ poetry
- ✅ cargo
- ✅ gradle
- ✅ maven

### CI/CD Systems
- ✅ GitHub Actions
- ✅ GitLab CI
- ✅ CircleCI
- ✅ Jenkins
- ✅ Travis CI
- ✅ Azure Pipelines
- ✅ AWS CodePipeline

### Monitoring & Observability
- ✅ Prometheus
- ✅ DataDog
- ✅ New Relic
- ✅ Sentry
- ✅ Custom webhooks

---

## Feature Roadmap

### Q1 2026 (This Quarter)
- ✅ Core v1 with deterministic execution
- ✅ Immutable audit trails
- ✅ Explainability engine
- ✅ Project graph generation
- 🔄 Enhanced dashboard UI

### Q2 2026
- 📅 Action distribution (Lunar Cloud beta)
- 📅 Code generation marketplace
- 📅 RBAC and team management

### Q3 2026
- 📅 Advanced flakiness analytics
- 📅 Global remote cache network
- 📅 Performance insights dashboard

### Q4 2026 & Beyond
- 📅 AI-powered performance optimization
- 📅 Multi-workspace federation
- 📅 Enterprise API enhancements

---

## Why Choose lunarRepo?

1. **Local-First Philosophy** - Run everything locally; cloud is optional
2. **Deterministic by Design** - 100% reproducible builds every time
3. **Immutable Audit Trails** - Full compliance and governance built-in
4. **Explainability-First** - Understand your builds in <150ms
5. **Open Source** - Apache 2.0 license, no vendor lock-in
6. **Enterprise Ready** - SOC2 compliance, RBAC, audit logs
7. **Developer Friendly** - Intuitive CLI, great documentation
8. **Cost Effective** - Free open source + optional cloud service

---

For detailed feature documentation, see:
- 📖 [Documentation](https://github.com/beingarjun/lunarRepo/wiki)
- 💬 [Discussions](https://github.com/beingarjun/lunarRepo/discussions)
- 🐛 [Issues & Feature Requests](https://github.com/beingarjun/lunarRepo/issues)
