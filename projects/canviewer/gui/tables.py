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
            self.setItem(i, 0, createTableItem(signal))
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
