import json, time, os, hashlib

AUDIT_DIR = "storage/audit"
os.makedirs(AUDIT_DIR, exist_ok=True)

def audit(event):
    payload = json.dumps({
        "event": event,
        "time": time.time()
    })
    digest = hashlib.sha256(payload.encode()).hexdigest()
    with open(f"{AUDIT_DIR}/{digest}.log", "w") as f:
        f.write(payload)
