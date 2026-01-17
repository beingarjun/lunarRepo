import yaml
import networkx as nx

def load_graph(file="lunar.yml"):
    with open(file) as f:
        data = yaml.safe_load(f)

    graph = nx.DiGraph()
    for project, cfg in data["projects"].items():
        graph.add_node(project)
        for dep in cfg.get("deps", []):
            graph.add_edge(dep, project)

    return graph, data
