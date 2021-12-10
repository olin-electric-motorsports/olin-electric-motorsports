# Script used to warn users of the status of the action runner
import os
print("Please check the status of the Action Runner by running cd /home/pi/actions-runner/; sudo ./svc.sh status. Before running any test scripts make sure the runner is inactive by running sudo ./svc.sh stop")
command = f'sudo ./svc.sh status'
os.system('cd /home/pi/actions-runner; echo %s|sudo -S %s' % ('formula', command))
