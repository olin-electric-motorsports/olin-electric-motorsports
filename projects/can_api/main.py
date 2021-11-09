from defs import PATH_TO
import cantools
import subprocess
import os
import yaml
from yaml_handler import *

def main(file_prefix):
    """
    TODO
    """
    #generate autogen yaml and dbc
    compiler = YAMLCompiler()
    compiler.generate_artifacts('files/mini_yamls', 'out/yaml')
    handler = Y2DHandler()
    handler.mini_dbc(f'out/yaml/autogen_{file_prefix}.yaml', 'out/dbcs/', file_prefix)
    # handler.mini_dbc('out/yaml/autogen_bms_core.yaml', 'out/dbcs/', 'bms_core')
    # handler.full_dbc('out/yaml', 'out/dbcs', 'mk5')

    #load the cantools file
    dbc_path = PATH_TO(f'out/dbcs/{file_prefix}.dbc')
    db = cantools.database.load_file(dbc_path)
    out = subprocess.run(['cantools', 'generate_c_source', '--no-floating-point-numbers', dbc_path])

    #open the yaml file
    with open(PATH_TO(f"out/yaml/{file_prefix}.yaml"), 'r') as f:
        data = yaml.load(f, yaml.FullLoader)

    # move generated files to ./out folder
    Path(PATH_TO("out/c_code")).mkdir(parents=True, exist_ok=True)
    os.replace(f"{file_prefix}.c", PATH_TO(f"out/c_code/{file_prefix}.c"))
    os.replace(f"{file_prefix}.h", PATH_TO(f"out/c_code/{file_prefix}.h"))
    
    msgs = data["MessagesTX"]
    if NUM_MSGS(msgs) > 6:
        print("this mini YAML has more than the maximum 6 messages.")
        return

    c_gen = CGenerator(file_prefix)
    c_gen.edit_file(msgs)

    header = HeaderGenerator(file_prefix)
    header.edit_file(msgs)

if __name__ == "__main__":
  #TODO add cmd line tools here
  main("air_ctrl")