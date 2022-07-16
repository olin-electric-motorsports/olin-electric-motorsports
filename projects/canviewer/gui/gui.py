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
        _,
        __,
    ) = yaml.safe_load_all(config_file)


class Window(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Olin Electric Motorsports CAN Viewer")
        self.setProperty("cssClass", "app")
        self.main_layout = QVBoxLayout()

        self.tables = self._createTables()
        self.titles = self._createTitles()

        self.main_layout.addLayout(self.titles)
        self.main_layout.addLayout(self.tables)
        self.main_layout.addWidget(createLogo())
        self.setLayout(self.main_layout)

        with open("projects/canviewer/gui/style.qss", "r") as stylesheet:
            self.setStyleSheet(stylesheet.read())

    def _createTitles(self):
        titles = QHBoxLayout()
        titles.addWidget(createLabel("Shutdown Nodes", "subtitle"))
        titles.addWidget(createLabel("Vehicle Values", "subtitle"))
        titles.addWidget(createLabel("Vehicle States", "subtitle"))

        self.main_layout.addWidget(createLabel("Olin Electric Motorsports CAN Dashboard", "title"))

        return titles

    def _createTables(self):
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

    def setData(self, shdnData, valuesData, statesData):
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
