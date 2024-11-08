from PyQt5.QtWidgets import QTableWidget, QTableWidgetItem, QHeaderView
from PyQt5 import QtCore
from PyQt5.QtGui import QColor

RED = QColor("#ef233c")
GREEN = QColor("#18c63d")

# Purely aesthetic, changes titles from raw message names to nicelt capitalized ones
DISPLAY_NAMES = {
    "air_control_critical": "AIR Control",
    "bms_core": "BMS Core",
    "throttle": "Throttle",
    "throttle_l_pos": "Throttle L Pos",
    "throttle_r_pos": "Throttle R Pos",
    "throttle_r_out_of_range": "Throttle R Out Of Range",
    "throttle_deviation": "Throttle Deviation",
    "throttle_brake_implaus": "Throttle Brake Implaus",
    "brake_gate": "Brake Gate",
    "brake_pressure": "Brake Pressure",
    "ready_to_drive": "Ready To Drive",
    "start_button_state": "Start Button State",
    "air_p_status": "Air P Status",
    "air_n_status": "Air N Status",
    "imd_status": "IMD Status",
    "pack_voltage": "Pack Voltage",
    "D3_Motor_Temperature": "D3 Motor Temperature",
    "max_temperature": "Max Temperature",
    "min_temperature": "Min Temperature",
    "D1_DC_Bus_Voltage": "D1 DC Bus Voltage",
    "Torque_Command": "Torque Command",
    "bms_fault_code": "BMS Fault Code",
    "csc_mia": "CSC MIA",
    "internal_die_temp": "Internal Die Temp",
    "IVT_Result_U1": "IVT Result U1",
    "IVT_Result_I": "IVT Result I",
    "IVT_Result_As": "IVT Result As",
    "IVT_Result_W": "IVT Result W",
    "IVT_Result_Wh": "IVT Result Wh",
    "lpms_gyro_x": "LPMS Gyro X",
    "lpms_gyro_z": "LPMS Gyro Z",
    "lpms_accel_y": "LPMS Accel Y",
    "lpms_accel_x": "LPMS Accel X",
    "lpms_accel_z": "LPMS Accel Z",
    "lpms_mag_y": "LPMS Mag Y",
    "lpms_mag_x": "LPMS Mag X",
    "lpms_mag_z": "LPMS Mag Z",
    "lpms_roll": "LPMS Roll",
    "lpms_pitch": "LPMS Pitch",
    "lpms_yaw": "LPMS Yaw",
    "lpms_q0": "LPMS Q0",
    "lpms_q1": "LPMS Q1",
    "lpms_q2": "LPMS Q2",
    "lpms_q3": "LPMS Q3"
}


class VehicleTable(QTableWidget):
    def __init__(self, headers, initial_data, col_num=2):
        super().__init__(len(initial_data), col_num)
        self.headers = headers

        # Headers (labels and evenly spacing them)
        self.setHorizontalHeaderLabels(self.headers)
        self.horizontalHeader().setStretchLastSection(True)
        self.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)

        # Hide the left index labels and the table grid
        self.verticalHeader().setVisible(False)
        self.setShowGrid(False)

    def setData(self, data):
        for i, (signal, val) in enumerate(data.items()):
            self.setItem(i, 0, createTableItem(DISPLAY_NAMES.get(signal, signal)))
            self.setItem(i, 1, createTableItem(val))


class StatesTable(VehicleTable):
    def __init__(self, headers, initial_data):
        super().__init__(headers, initial_data, 3)

    def setData(self, data):
        for i, (message_name, message_data) in enumerate(data.items()):
            # This code will NOT WORK on Python <3.7 due to dictionaries being unordered
            values = list(message_data.values())
            # Pad with nones if we can't fill all three columns
            values += [None] * (max(2 - len(values), 0))

            self.setItem(
                i, 0, createTableItem(DISPLAY_NAMES.get(message_name, message_name))
            )
            self.setItem(i, 1, createTableItem(values[0]))
            self.setItem(i, 2, createTableItem(values[1]))


def createTableItem(contents):
    cell = QTableWidgetItem(contents)
    cell.setFlags(QtCore.Qt.ItemIsEnabled)  # disables item editing
    cell.setTextAlignment(QtCore.Qt.AlignCenter)
    if contents == "OPEN":
        cell.setBackground(RED)
    elif contents == "CLOSED":
        cell.setBackground(GREEN)
    return cell
