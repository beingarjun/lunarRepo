import argparse
from graph import load_graph
from state import start_run
from executor import run_task
from cache import fingerprint, hit, write
from audit import audit

def main():
    parser = argparse.ArgumentParser(prog="lunar")
    parser.add_argument("command", choices=["run"])
    parser.add_argument("--role", default="dev")
    args = parser.parse_args()

    audit(f"CLI invoked by role={args.role}")

    run_id = start_run()
    graph, data = load_graph()

    for project, cfg in data["projects"].items():
        for task, meta in cfg["tasks"].items():
            key = f"{project}:{task}"
            h = fingerprint([meta["cmd"]])
            cached = hit(h)

            run_task(
                run_id=run_id,
                project=project,
                task=task,
                cmd=meta["cmd"],
                cached=cached
            )

            if not cached:
                write(h, {"project": project, "task": task})

if __name__ == "__main__":
    main()
