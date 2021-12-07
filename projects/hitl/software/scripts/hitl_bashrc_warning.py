import os
import warnings
# Script used to warn users of the status of the action runner
warnings.warn("The Action Runner status is below, before running any test scripts make sure the runner is inactive by running sudo ./svc.sh stop")
sudo_password = 'formula'
command = "./svc.sh status"
os.system('echo %s|sudo -S %s' % (sudo_password, command))