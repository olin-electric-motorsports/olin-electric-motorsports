#!/bin/bash

# patch the qr code plugin to support smaller qr codes and change default settings
cd "$(dirname "${BASH_SOURCE[0]}")"
DEST=$(find /usr/ -type f -name "qrcode_footprint_wizard.py")
sudo cp ./qr.patch.py "$DEST"