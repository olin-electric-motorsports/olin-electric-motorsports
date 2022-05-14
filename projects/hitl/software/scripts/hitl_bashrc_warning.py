# Script used to warn users of the status of the action runner
import os
command = f'sudo ./svc.sh status'
os.system('cd /home/pi/actions-runner; echo %s|sudo -S %s' % ('formula', command))
print("Above is the status of the action runner. Before running any test scripts make sure the runner is inactive by running sudo ./svc.sh stop")
