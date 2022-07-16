from PyQt5.QtWidgets import *
from PyQt5.QtGui import QFont, QPixmap, QColor
from PyQt5 import QtCore
import sys
import yaml

RED = QColor('#ef233c')
GREEN = QColor('#18c63d')

with open("projects/canviewer/config.yml", "r") as config_file:
    (
        INIT_SHUTDOWN_NODES,
        INIT_VEHICLE_VALUES,
        INIT_VEHICLE_STATES,
        _,
        __
    ) = yaml.safe_load_all(config_file)

class Window(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle('Olin Electric Motorsports CAN Viewer')
        self.setProperty('cssClass', 'app')
        self.shdn = self._createShutdownTable()
        self.values = self._createValuesTable()
        self.states = self._createStatesTable()
        self.main_layout = QVBoxLayout()

        self.titles = QHBoxLayout()
        self.titles.addWidget(createLabel('Shutdown Nodes', 'subtitle'))
        self.titles.addWidget(createLabel('Vehicle Values', 'subtitle'))
        self.titles.addWidget(createLabel('Vehicle States', 'subtitle'))

        self.tables = QHBoxLayout()
        self.tables.setProperty('cssClass', 'tables')
        self.tables.addWidget(self.shdn)
        self.tables.addWidget(self.values)
        self.tables.addWidget(self.states)

        self.main_layout.addWidget(createLabel('Olin Electric Motorsports CAN Dashboard', 'title'))
        self.main_layout.addLayout(self.titles)
        self.main_layout.addLayout(self.tables)
        self.main_layout.addWidget(createLogo())
        self.setLayout(self.main_layout)

        with open('projects/canviewer/style.qss', 'r') as stylesheet:
            self.setStyleSheet(stylesheet.read())

    def _createShutdownTable(self):
        return VehicleTable(['Shutdown Node', 'Status'], INIT_SHUTDOWN_NODES)

    def _createValuesTable(self):
        return VehicleTable(['Name', 'Value'], INIT_VEHICLE_VALUES)

    def _createStatesTable(self):
        return StatesTable(['Name', 'State', 'Fault'], INIT_VEHICLE_STATES)

    def setData(self, shdnData, valuesData, statesData):
        self.shdn.setData(shdnData)
        self.values.setData(valuesData)
        self.states.setData(statesData)

def createLogo():
    img = QPixmap('projects/canviewer/logo.png')
    img = img.scaled(300, 300, QtCore.Qt.KeepAspectRatio)
    label = QLabel()
    label.setPixmap(img)
    label.setAlignment(QtCore.Qt.AlignCenter)
    return label

def createLabel(text, cssClass=None):
    label = QLabel(text)
    if cssClass is not None:
        label.setProperty('cssClass', cssClass)
    return label

class VehicleTable(QTableWidget):

    def __init__(self, headers, initial_data, col_num=2):
        super().__init__(len(initial_data), col_num)
        self.headers = headers

        self.setHorizontalHeaderLabels(self.headers)
        self.horizontalHeader().setStretchLastSection(True)
        self.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)

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
        for i, (signal, val) in enumerate(data.items()):
            self.setItem(i, 0, createTableItem(signal))
            self.setItem(i, 1, createTableItem(val[0]))
            self.setItem(i, 2, createTableItem(val[1]))

def createTableItem(contents):
    cell = QTableWidgetItem(contents)
    cell.setFlags(QtCore.Qt.ItemIsEnabled)
    cell.setTextAlignment(QtCore.Qt.AlignCenter)
    if contents == 'OPEN':
        cell.setBackground(RED)
    elif contents == 'CLOSED':
        cell.setBackground(GREEN)
    return cell

def run():
    app = QApplication(sys.argv)
    window = Window()
    window.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    run()
