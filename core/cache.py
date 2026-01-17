import hashlib, os, json

CACHE_DIR = "storage/cache"
os.makedirs(CACHE_DIR, exist_ok=True)

def fingerprint(inputs):
    h = hashlib.sha256()
    for i in inputs:
        h.update(i.encode())
    return h.hexdigest()

def hit(key):
    return os.path.exists(f"{CACHE_DIR}/{key}.json")

def write(key, meta):
    with open(f"{CACHE_DIR}/{key}.json", "w") as f:
        json.dump(meta, f)
