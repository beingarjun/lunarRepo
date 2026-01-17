REASONS = {
    "cache_hit": "Skipped because inputs did not change.",
    "executed": "Executed because inputs changed.",
    "failed": "Execution failed."
}

def explain(reason):
    return REASONS.get(reason, "Unknown reason.")
