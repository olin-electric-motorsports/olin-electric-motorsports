from PyQt5.QtWidgets import *
from PyQt5.QtGui import QFont, QPixmap, QColor
from PyQt5 import QtCore
import sys
import yaml
from gui.tables import VehicleTable, StatesTable
from gui.utils import createLabel, createLogo

with open("projects/canviewer/config.yml", "r") as config_file:
    (
        INIT_SHUTDOWN_NODES,
        INIT_VEHICLE_VALUES,
        INIT_VEHICLE_STATES,
        INIT_LPMS_VALUES,  # Assuming you have LPMS data in your config
    ) = yaml.safe_load_all(config_file)

# Example dictionary containing extra information for each variable
EXTRA_INFO = {
    "Battery Voltage": "Indicates the voltage level of the battery.",
    "Motor Temperature": "Shows the current temperature of the motor.",
    "Brake Pressure": "Displays the pressure in the braking system.",
    "Shutdown Node 1": "Monitors the status of shutdown system 1.",
    "State Error": "Reports if there is an error in the vehicle state.",
    "BMS Fault Code": "Indicates things wrong with BMS.",
    "LPMS Data": "Contains information related to the LPMS system."  # Add more specific info as needed
}

class Window(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Olin Electric Motorsports CAN Viewer")
        self.setProperty("cssClass", "app")
        self.main_layout = QVBoxLayout()

        self.hidden_sections = []  # To track hidden sections

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
        """Create main title as table titles"""
        titles = QHBoxLayout()

        self.shutdown_title = createLabel("Shutdown Nodes", "subtitle")
        self.vehicle_values_title = createLabel("Vehicle Values", "subtitle")
        self.vehicle_states_title = createLabel("Vehicle States", "subtitle")
        self.lpms_title = createLabel("LPMS", "subtitle")  # New LPMS title

        # Set tooltips for titles
        self.shutdown_title.setToolTip("View the status of shutdown nodes.")
        self.vehicle_values_title.setToolTip("View real-time vehicle data.")
        self.vehicle_states_title.setToolTip("View vehicle state and fault information.")
        self.lpms_title.setToolTip("View LPMS data.")  # Tooltip for LPMS

        # Enable mouse click events
        self.shutdown_title.setCursor(QtCore.Qt.PointingHandCursor)
        self.vehicle_values_title.setCursor(QtCore.Qt.PointingHandCursor)
        self.vehicle_states_title.setCursor(QtCore.Qt.PointingHandCursor)
        self.lpms_title.setCursor(QtCore.Qt.PointingHandCursor)  # Cursor for LPMS

        # Connect the clicked signal to toggle table visibility
        self.shutdown_title.mousePressEvent = lambda event: self._toggleVisibility("Shutdown Nodes", self.shutdown_title, self.shdn)
        self.vehicle_values_title.mousePressEvent = lambda event: self._toggleVisibility("Vehicle Values", self.vehicle_values_title, self.values)
        self.vehicle_states_title.mousePressEvent = lambda event: self._toggleVisibility("Vehicle States", self.vehicle_states_title, self.states)
        self.lpms_title.mousePressEvent = lambda event: self._toggleVisibility("LPMS", self.lpms_title, self.lpms)  # Toggle for LPMS

        titles.addWidget(self.shutdown_title)
        titles.addWidget(self.vehicle_values_title)
        titles.addWidget(self.vehicle_states_title)
        titles.addWidget(self.lpms_title)  # Add LPMS title to layout

        self.main_layout.addWidget(
            createLabel("Olin Electric Motorsports CAN Dashboard", "title")
        )

        return titles

    def _createTables(self):
        """Create four tables and add them to the layout"""
        self.shdn = self._createShutdownTable()
        self.values = self._createValuesTable()
        self.states = self._createStatesTable()
        self.lpms = self._createLpmsTable()  # Create LPMS table

        tables = QHBoxLayout()
        tables.setProperty("cssClass", "tables")
        tables.addWidget(self.shdn)
        tables.addWidget(self.values)
        tables.addWidget(self.states)
        tables.addWidget(self.lpms)  # Add LPMS table to layout

        return tables

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

    def _createLpmsTable(self):
        table = VehicleTable(["LPMS Parameter", "Value"], INIT_LPMS_VALUES)  # Create LPMS table
        table.cellClicked.connect(self._showTooltipWindow)
        return table

    def _showTooltipWindow(self, row, column):
        """Show a tooltip window with extra information for the selected variable"""
        item = self.sender().item(row, column)
        if item:
            variable_name = item.text()
            extra_info = EXTRA_INFO.get(variable_name, "No additional information available.")
            message = f"{variable_name}:\n{extra_info}"
            msg_box = QMessageBox()
            msg_box.setWindowTitle("Information")
            msg_box.setText(message)
            msg_box.exec_()

    def _createHiddenSectionWidget(self):
        """Create a widget to display hidden sections in the top-right corner"""
        hidden_widget = QWidget()
        hidden_layout = QVBoxLayout()
        hidden_layout.setAlignment(QtCore.Qt.AlignTop | QtCore.Qt.AlignRight)
        self.hidden_section_label = QLabel("Hidden Sections:")
        self.hidden_section_label.setProperty("cssClass", "hiddenTitle")
        self.hidden_section_list = QVBoxLayout()

        hidden_layout.addWidget(self.hidden_section_label)
        hidden_layout.addLayout(self.hidden_section_list)
        hidden_widget.setLayout(hidden_layout)
        hidden_widget.setVisible(False)  # Initially hidden

        return hidden_widget

    def setData(self, shdnData, valuesData, statesData, lpmsData):
        """Update the four tables' data"""
        self.shdn.setData(shdnData)
        self.values.setData(valuesData)
        self.states.setData(statesData)
        self.lpms.setData(lpmsData)  # Update LPMS table data

def run():
    app = QApplication(sys.argv)
    window = Window()
    window.show()
    sys.exit(app.exec_())

if __name__ == "__main__":
    run()
