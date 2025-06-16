"""
High Speed Motor Calibration Script

Instructions:
1. connect a can dongle to the car and run calibrate.py
2. the motor will start spinning. The rpm will print out in the terminal
3. according to the docs, the motor should be spinning at around 1k rpm
4. in the terminal, hit ctrl+c to stop the motor, then ctrl+c again to stop the output in the terminal
5. read the value for Delta Resolver Filtered, it should be as close to -90 degrees as possible

The timing of the second SIGINT (ctrl+c) to be fairly close to the first such that you can scroll up in your terminal and read the values for when the motor was spinning at a high speed but was not energized.

docs (section 4.1.3: Resolve Angle Offset Adjustment (Gamma Adjust)):
https://app.box.com/s/vf9259qlaadhzxqiqrt5cco8xpsn84hk/file/1687150117689
"""

import can
import cantools
import time

INV_CONTROL_CAN_ID = (
    0xC0  # relevant calibration control, for inv enable/disable and torque command
)
INV_PARAMETER_CAN_ID = 0xA5  # relevant calibration parameters, broadcast message

INV_GAMMA_ADJ_CAN_ID = 0x0C # gamma adjust

TORQUE_COMMAND = 4.0

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
                "Torque_Command": TORQUE_COMMAND,
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
