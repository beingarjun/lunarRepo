layout: default
title: lunarRepo

#  lunarRepo  Local-First Build & Task Orchestration

> Deterministic, cache-friendly orchestration for builds, tests, and data pipelines  with explainability, observability, and governance built in.

[![Live Demo](https://img.shields.io/badge/_Quick_Demo-CLI%20+%20Dashboard-blue?style=for-the-badge)](#-live-demo)
[![Docs](https://img.shields.io/badge/_Docs-Getting_Started-green?style=for-the-badge)](#-getting-started)
[![GitHub](https://img.shields.io/badge/Code-lunarRepo-black?style=for-the-badge)](https://github.com/beingarjun/lunarRepo)
[![License](https://img.shields.io/badge/License-Apache_2.0-orange?style=for-the-badge)](https://github.com/beingarjun/lunarRepo/blob/main/LICENSE)


##  The Problem: Fragile, Opaque Pipelines



##  Our Solution: Deterministic, Local-First Orchestration

| Capability     | Conventional Tools | lunarRepo               | Advantage                          |
|----------------|--------------------|-------------------------|------------------------------------|
| Execution      | Best-effort        | Deterministic           | Reliable, reproducible runs        |
| Caching        | Path-based         | Content-addressed       | Fewer re-runs, faster builds       |
| Explainability | Minimal            | "Why did this run?" logs| Faster debugging, audit-ready      |
| Auditability   | Limited logs       | Immutable audit trail   | Governance and compliance          |
| Footprint      | Cloud-first        | Local-first, CI-ready   | No lock-in, private by default     |


##  Live Demo

Run locally to see deterministic execution, cache hits, and audit trails:

```bash
# Orchestrator
python core/cli.py run

# API + dashboard
uvicorn server.api:app
open server/dashboard.html
```

Explore runs, cache keys, and "why" explanations directly in the dashboard.


##  Where It Fits



##  Architecture

```
[Tasks & Pipelines]
        |
        v
[Scheduler] --> [Deterministic Executor] --> [Content-Addressed Cache]
        |                                  |
        |                                  v
        |                          [Immutable Audit Log]
        v
[API + Dashboard] <---- metrics/logs ----> [Observers]
```


##  Core Components



##  Outcomes



##  API & Integrations (examples)


Example health check:
```bash
curl http://localhost:8000/api/v1/health
```


##  Getting Started

1) Clone the repo and install dependencies.
2) Run the orchestrator and dashboard:
```bash
python core/cli.py run
uvicorn server.api:app
open server/dashboard.html
```
3) Inspect runs, cache hits, and audit history in the dashboard.


##  Repository Layout (simplified)

```
core/          # CLI and task engine
server/        # API and dashboard assets
storage/       # Local data and cache
docs/          # Site and docs
ci/            # CI helpers
```

See full source and issues on GitHub: https://github.com/beingarjun/lunarRepo


##  License

Apache 2.0
