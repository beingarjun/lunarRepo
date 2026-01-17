from fastapi import FastAPI
import os, json

app = FastAPI()

@app.get("/runs")
def runs():
    runs = []
    for f in os.listdir("storage/runs"):
        with open(f"storage/runs/{f}") as fh:
            runs.append(json.load(fh))
    return runs
