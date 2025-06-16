"""
High Speed Motor Calibration Script
"""

import can
import cantools
import time

INV_CONTROL_CAN_ID = (
    0xC0  # relevant calibration control, for inv enable/disable and torque command
)
INV_PARAMETER_CAN_ID = 0xA5  # relevant calibration parameters, broadcast message

INV_GAMMA_ADJ_CAN_ID = 0x0C # gamma adjust

def calibrate():
    """
    Run high speed motor calibration.
    """
    # set up can interface
    bus = can.interface.Bus("can0", interface="socketcan")

    # load motor controller dbc
    cm200dx_dbc = cantools.database.load_file(
        "../../vehicle/common/motor_controller/cm200dx.dbc"
    )  # relative path for now

    # get 0xC0 and 0xA5 messages from dbc
    control_msg_dbc = cm200dx_dbc.get_message_by_name("M192_Command_Message")
    parameter_msg = cm200dx_dbc.get_message_by_name("M165_Motor_Position_Info")

    # build 0xC0 command dict
    control_data = control_msg_dbc.encode(
        {
            "Torque_Command": 0.0,
            "Speed_Command": 0,
            "Direction_Command": 0,  # optional, e.g. 0 = forward
            "Inverter_Enable": 0,
            "Inverter_Discharge": 0,
            "Speed_Mode_Enable": 0,  # optional
            "Torque_Limit_Command": 0.0,  # optional
            "Rolling_Counter": 0,
        }
    )

    # disable motor controller, must be done to remove lockout
    control_msg = can.Message(
        arbitration_id=INV_CONTROL_CAN_ID, data=control_data, is_extended_id=False
    )
    bus.send(control_msg)

    time.sleep(0.1)

    # enable motor controller
    control_data = control_msg_dbc.encode(
        {
            "Torque_Command": 0.0,
            "Speed_Command": 0,
            "Direction_Command": 0,  # optional, e.g. 0 = forward
            "Inverter_Enable": 1,
            "Inverter_Discharge": 0,
            "Speed_Mode_Enable": 0,  # optional
            "Torque_Limit_Command": 0.0,  # optional
            "Rolling_Counter": 0,
        }
    )
    control_msg = can.Message(
        arbitration_id=INV_CONTROL_CAN_ID, data=control_data, is_extended_id=False
    )
    bus.send(control_msg)

    # spin to 1k rpm
    # NOTE: using a manually tuned, hard-coded value because torque mode is active
    # do not run without first reducing this value for cars beyond mkvii
    try:
      while True:
        control_data = control_msg_dbc.encode(
            {
                "Torque_Command": 4.0,
                "Speed_Command": 0,
                "Direction_Command": 0,  # optional, e.g. 0 = forward
                "Inverter_Enable": 1,
                "Inverter_Discharge": 0,
                "Speed_Mode_Enable": 0,  # optional
                "Torque_Limit_Command": 0.0,  # optional
                "Rolling_Counter": 0,
            }
        )
        control_msg = can.Message(
            arbitration_id=INV_CONTROL_CAN_ID, data=control_data, is_extended_id=False
        )
        bus.send(control_msg)
        time.sleep(0.1)
    except KeyboardInterrupt:
        control_data = control_msg_dbc.encode(
            {
                "Torque_Command": 0.0,
                "Speed_Command": 0,
                "Direction_Command": 0,  # optional, e.g. 0 = forward
                "Inverter_Enable": 0,
                "Inverter_Discharge": 0,
                "Speed_Mode_Enable": 0,  # optional
                "Torque_Limit_Command": 0.0,  # optional
                "Rolling_Counter": 0,
            }
        )
        control_msg = can.Message(
            arbitration_id=INV_CONTROL_CAN_ID, data=control_data, is_extended_id=False
        )
        bus.send(control_msg)

        while True:
          message = bus.recv(timeout=1.0)
          if message is None:
              continue

          if message.arbitration_id == INV_PARAMETER_CAN_ID:
              decoded = parameter_msg.decode(message.data)
              
              print(f"Motor Speed: {decoded['Motor_Speed']} rpm")
              print(f"Motor Angle: {decoded['Motor_Angle_Electrical']} deg")
              print(
                  f"Electrical Output Frequency: {decoded['Electrical_Output_Frequency']} Hz"
              )
              print(
                  f"Delta Resolver Filtered: {decoded['Delta_Resolver_Filtered']} deg"
              )
              print("---")

        print("Ending calibration.")
    # # # wait a few seconds
    # time.sleep(3)

    # # disable motor controller
    # control_data["Inverter_Enable"] = 0
    # control_msg = can.Message(
    #     arbitration_id=INV_CONTROL_CAN_ID, data=control_data, is_extended_id=False
    # )
    # bus.send(control_msg)

    # # read relevant parameters over can
    # try:
    #     while True:
    #         message = bus.recv(timeout=1.0)
    #         if message is None:
    #             continue

    #         if message.arbitration_id == INV_PARAMETER_CAN_ID:
    #             decoded = parameter_msg.decode(message.data)
    #             print(f"Motor Speed: {decoded['Motor_Speed']} rpm")
    #             print(f"Motor Angle: {decoded['Motor_Angle_Electrical']} deg")
    #             print(
    #                 f"Electrical Output Frequency: {decoded['Electrical_Output_Frequency']} Hz"
    #             )
    #             print(
    #                 f"Delta Resolver Filtered: {decoded['Delta_Resolver_Filtered']} deg"
    #             )
    #             print("---")
    # except KeyboardInterrupt:
    #     print("End calibration")


if __name__ == "__main__":
    calibrate()
