import json, os, uuid, time

STATE_DIR = "storage/runs"
os.makedirs(STATE_DIR, exist_ok=True)

def start_run():
    run_id = str(uuid.uuid4())
    path = f"{STATE_DIR}/{run_id}.json"
    with open(path, "w") as f:
        json.dump({
            "run_id": run_id,
            "started": time.time(),
            "tasks": {}
        }, f, indent=2)
    return run_id

def update_task(run_id, key, status, reason):
    path = f"{STATE_DIR}/{run_id}.json"
    with open(path) as f:
        data = json.load(f)

    data["tasks"][key] = {
        "status": status,
        "reason": reason,
        "timestamp": time.time()
    }

    with open(path, "w") as f:
        json.dump(data, f, indent=2)
