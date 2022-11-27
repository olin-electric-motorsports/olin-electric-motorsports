import argparse

def make_parser():
    parser = argparse.ArgumentParser(
        description="html template adjuster",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('file',
                        type=str,
                        help="html file path")
    return parser

def adjust_width(file_path):
    with open(file_path, 'r') as ibom_html:
        data = ibom_html.readlines()

    for index, line in enumerate(data):
        if ".bom .value" in line:
            data[index+1] = "  width: 100px;\n"

            with open(file_path, 'w') as updated_ibom_html:
                updated_ibom_html.writelines(data)
            break

if __name__ == "__main__":
    cl_parser = make_parser()
    file_path = cl_parser.parse_args().file
    adjust_width(file_path)