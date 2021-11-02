import cancontroller

controller = cancontroller.CANController('../artifacts/dash.dbc', 'vcan0')

r2d = str(controller.get_state('Ready2Drive'))
print(r2d)
