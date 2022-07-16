from PyQt5 import QtCore
from PyQt5.QtWidgets import QLabel
from PyQt5.QtGui import QPixmap


def createLogo():
    img = QPixmap("projects/canviewer/gui/logo.png")
    img = img.scaled(300, 300, QtCore.Qt.KeepAspectRatio)
    label = QLabel()
    label.setPixmap(img)
    label.setAlignment(QtCore.Qt.AlignCenter)
    return label


def createLabel(text, cssClass=None):
    label = QLabel(text)
    if cssClass is not None:
        label.setProperty("cssClass", cssClass)
    return label
