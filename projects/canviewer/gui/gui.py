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
    ) = yaml.safe_load_all(config_file)


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

        # Enable mouse click events
        self.shutdown_title.setCursor(QtCore.Qt.PointingHandCursor)
        self.vehicle_values_title.setCursor(QtCore.Qt.PointingHandCursor)
        self.vehicle_states_title.setCursor(QtCore.Qt.PointingHandCursor)

        # Connect the clicked signal to toggle table visibility
        self.shutdown_title.mousePressEvent = lambda event: self._toggleVisibility("Shutdown Nodes", self.shutdown_title, self.shdn)
        self.vehicle_values_title.mousePressEvent = lambda event: self._toggleVisibility("Vehicle Values", self.vehicle_values_title, self.values)
        self.vehicle_states_title.mousePressEvent = lambda event: self._toggleVisibility("Vehicle States", self.vehicle_states_title, self.states)

        titles.addWidget(self.shutdown_title)
        titles.addWidget(self.vehicle_values_title)
        titles.addWidget(self.vehicle_states_title)

        self.main_layout.addWidget(
            createLabel("Olin Electric Motorsports CAN Dashboard", "title")
        )

        return titles

    def _createTables(self):
        """Create three tables and add them to the layout"""
        self.shdn = self._createShutdownTable()
        self.values = self._createValuesTable()
        self.states = self._createStatesTable()

        tables = QHBoxLayout()
        tables.setProperty("cssClass", "tables")
        tables.addWidget(self.shdn)
        tables.addWidget(self.values)
        tables.addWidget(self.states)

        return tables

    def _createShutdownTable(self):
        return VehicleTable(["Shutdown Node", "Status"], INIT_SHUTDOWN_NODES)

    def _createValuesTable(self):
        return VehicleTable(["Name", "Value"], INIT_VEHICLE_VALUES)

    def _createStatesTable(self):
        return StatesTable(["Name", "State", "Fault"], INIT_VEHICLE_STATES)

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

    def _updateHiddenSectionWidget(self):
        """Update the hidden section widget to reflect the current hidden sections"""
        # Clear the list
        for i in reversed(range(self.hidden_section_list.count())):
            self.hidden_section_list.itemAt(i).widget().setParent(None)

        # Add the hidden sections
        for section in self.hidden_sections:
            button = QPushButton(section)
            button.setCursor(QtCore.Qt.PointingHandCursor)
            button.clicked.connect(lambda checked, s=section: self._restoreSection(s))
            self.hidden_section_list.addWidget(button)

        # Show or hide the widget based on whether there are hidden sections
        self.hidden_section_widget.setVisible(len(self.hidden_sections) > 0)

    def _toggleVisibility(self, section_name, title, table):
        """Toggle the visibility of a title and table, and update hidden sections"""
        if table.isVisible():
            table.setVisible(False)
            title.setVisible(False)
            self.hidden_sections.append(section_name)
        else:
            table.setVisible(True)
            title.setVisible(True)
            self.hidden_sections.remove(section_name)

        self._updateHiddenSectionWidget()

    def _restoreSection(self, section_name):
        """Restore a hidden section when its button is clicked"""
        if section_name == "Shutdown Nodes":
            self.shdn.setVisible(True)
            self.shutdown_title.setVisible(True)
        elif section_name == "Vehicle Values":
            self.values.setVisible(True)
            self.vehicle_values_title.setVisible(True)
        elif section_name == "Vehicle States":
            self.states.setVisible(True)
            self.vehicle_states_title.setVisible(True)

        self.hidden_sections.remove(section_name)
        self._updateHiddenSectionWidget()

    def setData(self, shdnData, valuesData, statesData):
        """Update the three tables' data"""
        self.shdn.setData(shdnData)
        self.values.setData(valuesData)
        self.states.setData(statesData)

def run():
    app = QApplication(sys.argv)
    window = Window()
    window.show()
    sys.exit(app.exec_())


if __name__ == "__main__":
    run()
