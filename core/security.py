ROLES = {
    "dev": {"run"},
    "lead": {"run", "view"},
    "admin": {"run", "view", "audit"}
}

def authorize(role, action):
    return action in ROLES.get(role, set())
