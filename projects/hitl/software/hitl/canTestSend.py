import cancontroller

controller = cancontroller.CANController('../artifacts/dash.dbc', 'vcan0')

tsms = str(controller.get_state('TSMS_Sense'))
print(tsms)
controller.set_state("TSMS_Sense", 1)