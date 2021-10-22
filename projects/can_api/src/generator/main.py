def main(file_prefix):
    """
    TODO
    """
    #load the cantools file
    dbc_path = f'../dbc/{file_prefix}.dbc'
    db = cantools.database.load_file(dbc_path)
    out = subprocess.run(['cantools', 'generate_c_source', '--no-floating-point-numbers', dbc_path])

    #open the yaml file
    with open(f"../mini_yamls/{file_prefix}.yaml", 'r') as f:
        data = yaml.load(f, yaml.FullLoader)

    # move generated files to ./out folder
    Path("./out").mkdir(exist_ok=True)
    os.replace(f"{file_prefix}.c", f"./out/{file_prefix}.c")
    os.replace(f"{file_prefix}.h", f"./out/{file_prefix}.h")
    
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
  main("shutdown")