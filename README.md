# 🌕 lunarRepo

lunarRepo is a free, open-source, local-first build and task orchestration
system with explainability, observability, and governance.

## Features
- Deterministic task execution
- Content-addressed caching
- "Why did this run?" explainability
- Immutable audit logs
- Web-based observability
- CI-ready
- No cloud, no lock-in

## Run
```bash
python core/cli.py run
```

## Dashboard
```bash
uvicorn server.api:app
open server/dashboard.html
```

## License

Apache 2.0
