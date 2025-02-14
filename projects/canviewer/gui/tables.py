from PyQt5.QtWidgets import *
from PyQt5.QtGui import QFont, QPixmap, QColor
from PyQt5 import QtCore
import sys
import yaml
from gui.tables import VehicleTable, StatesTable
from gui.utils import createLabel, createLogo

with open("projects/canviewer/config.yml", "r") as config_file:
    yaml_data = list(yaml.safe_load_all(config_file))
    while len(yaml_data) < 8:
        yaml_data.append([])  # Ensure all lists exist
    (
        INIT_SHUTDOWN_NODES,
        INIT_VEHICLE_VALUES,
        INIT_VEHICLE_STATES,
        INIT_LPMS,
        INIT_BMS,
        INIT_LV,
        INIT_HV,
        INIT_SENSING,
    ) = yaml_data

EXTRA_INFO = {
    "Battery Voltage": "Indicates the voltage level of the battery.",
    "Motor Temperature": "Shows the current temperature of the motor.",
    "Brake Pressure": "Displays the pressure in the braking system.",
    "Shutdown Node 1": "Monitors the status of shutdown system 1.",
    "State Error": "Reports if there is an error in the vehicle state.",
}

class Window(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Olin Electric Motorsports CAN Viewer")
        self.setProperty("cssClass", "app")
        self.main_layout = QVBoxLayout()

        self.hidden_sections = ["LPMS", "BMS", "LV", "HV", "Sensing"]  # Hidden by default

        self.tables = self._createTables()
        self.titles = self._createTitles()
        self.hidden_section_widget = self._createHiddenSectionWidget()

        self.main_layout.addLayout(self.titles)
        self.main_layout.addLayout(self.tables)
        self.main_layout.addWidget(self.hidden_section_widget)
        self.main_layout.addWidget(createLogo())
        self.setLayout(self.main_layout)

        with open("projects/canviewer/gui/style.qss", "r") as stylesheet:
            self.setStyleSheet(stylesheet.read())

    def _createTitles(self):
        titles = QHBoxLayout()

        self.section_titles = {
            "Shutdown Nodes": createLabel("Shutdown Nodes", "subtitle"),
            "Vehicle Values": createLabel("Vehicle Values", "subtitle"),
            "Vehicle States": createLabel("Vehicle States", "subtitle"),
            "LPMS": createLabel("LPMS", "subtitle"),
            "BMS": createLabel("BMS", "subtitle"),
            "LV": createLabel("LV", "subtitle"),
            "HV": createLabel("HV", "subtitle"),
            "Sensing": createLabel("Sensing", "subtitle"),
        }

        for name, title in self.section_titles.items():
            title.setCursor(QtCore.Qt.PointingHandCursor)
            title.mousePressEvent = lambda event, n=name: self._toggleVisibility(n)
            titles.addWidget(title)

        self.main_layout.addWidget(createLabel("Olin Electric Motorsports CAN Dashboard", "title"))
        return titles

    def _createTables(self):
        self.tables_dict = {
            "Shutdown Nodes": self._createShutdownTable(),
            "Vehicle Values": self._createValuesTable(),
            "Vehicle States": self._createStatesTable(),
            "LPMS": self._createLPMSTable(),
            "BMS": self._createBMSTable(),
            "LV": self._createLVTable(),
            "HV": self._createHVTable(),
            "Sensing": self._createSensingTable(),
        }

        tables = QHBoxLayout()
        tables.setProperty("cssClass", "tables")
        for name, table in self.tables_dict.items():
            table.setVisible(name not in self.hidden_sections)
            tables.addWidget(table)

        return tables

    def _toggleVisibility(self, section_name):
        if section_name in self.hidden_sections:
            self.hidden_sections.remove(section_name)
            self.tables_dict[section_name].setVisible(True)
            self.section_titles[section_name].setVisible(True)
        else:
            self.hidden_sections.append(section_name)
            self.tables_dict[section_name].setVisible(False)
            self.section_titles[section_name].setVisible(False)
        self._updateHiddenSectionWidget()

    def _createShutdownTable(self):
        table = VehicleTable(["Shutdown Node", "Status"], INIT_SHUTDOWN_NODES)
        table.cellClicked.connect(self._showTooltipWindow)
        return table

    def _createValuesTable(self):
        table = VehicleTable(["Name", "Value"], INIT_VEHICLE_VALUES)
        table.cellClicked.connect(self._showTooltipWindow)
        return table

    def _createStatesTable(self):
        table = StatesTable(["Name", "State", "Fault"], INIT_VEHICLE_STATES)
        table.cellClicked.connect(self._showTooltipWindow)
        return table

    def _createLPMSTable(self):
        return VehicleTable(["LPMS Data", "Value"], INIT_LPMS)

    def _createBMSTable(self):
        return VehicleTable(["BMS Data", "Value"], INIT_BMS)

    def _createLVTable(self):
        return VehicleTable(["LV Data", "Value"], INIT_LV)

    def _createHVTable(self):
        return VehicleTable(["HV Data", "Value"], INIT_HV)

    def _createSensingTable(self):
        return VehicleTable(["Sensor", "Value"], INIT_SENSING)

    def _showTooltipWindow(self, row, column):
        item = self.sender().item(row, column)
        if item:
            variable_name = item.text()
            extra_info = EXTRA_INFO.get(variable_name, "No additional information available.")
            message = f"{variable_name}:\n{extra_info}"
            msg_box = QMessageBox()
            msg_box.setWindowTitle("Information")
            msg_box.setText(message)
            msg_box.exec_()

    def setData(self, shdnData, valuesData, statesData, lpmsData, bmsData, lvData, hvData, sensingData):
        self.shdn.setData(shdnData)
        self.values.setData(valuesData)
        self.states.setData(statesData)
        self.lpms.setData(lpmsData)
        self.bms.setData(bmsData)
        self.lv.setData(lvData)
        self.hv.setData(hvData)
        self.sensing.setData(sensingData)

def run():
    app = QApplication(sys.argv)
    window = Window()
    window.show()
    sys.exit(app.exec_())

if __name__ == "__main__":
    run()
