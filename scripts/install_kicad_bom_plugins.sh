#!/bin/bash

pushd $(dirname $(realpath $0 ))
sudo cp ./kicad_bom_custom.py /usr/share/kicad/plugins/kicad_bom_custom.py
sudo cp ./list_library_parts.py /usr/share/kicad/plugins/list_library_parts.py