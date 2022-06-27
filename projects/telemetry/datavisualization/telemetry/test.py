import yaml


with open("../config.yaml", "r", encoding="utf-8") as yaml_file:
    config = yaml.safe_load(yaml_file)

print(config["DASH"])
