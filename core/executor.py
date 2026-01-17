import subprocess, threading
from state import update_task
from audit import audit

LOCK = threading.Lock()

def run_task(run_id, project, task, cmd, cached):
    key = f"{project}:{task}"

    with LOCK:
        if cached:
            update_task(run_id, key, "SKIPPED", "cache_hit")
            audit(f"{key} skipped (cache)")
            return

        update_task(run_id, key, "RUNNING", "executed")
        audit(f"{key} started")

        result = subprocess.run(cmd, shell=True)

        if result.returncode == 0:
            update_task(run_id, key, "SUCCESS", "executed")
            audit(f"{key} success")
        else:
            update_task(run_id, key, "FAILED", "failed")
            audit(f"{key} failed")
