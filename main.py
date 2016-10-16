import sys

from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtQml import *
from PyQt5.QtWidgets import *
from PyQt5.QtQuick import *

#
# Gotten from https://wiki.python.org/moin/PyQt/QML%20callback%20function
#

# This class will emit the current date and time as a signal when
# requested.
class iceController(QObject):

    ice = pyqtSignal(str)

    def emit_now(self):
        formatted_date = QDateTime.currentDateTime().toString()
        self.ice.emit(formatted_date)

class iceController(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.callback = []

    def dump(self):
        print('Dump was called')
        for c in self.callback:
            c.call([QJSValue('asdf')])
        self.callback=[]

    @pyqtSlot(str, 'QJSValue')
    def enqueue(self, command, callback):
        print('Enqueuing function of %s' % command)
        self.callback.append(QJSValue(callback))

    @pyqtSlot()
    def processResponses(self):
        print('processing responses')
        self.dump()

#    @pyqtSlot(str)
#    def log(self, s):
#        print(s)

def main():

    ice = iceController()
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()

    ice = iceController()
    engine.rootContext().setContextProperty('PyConsole', ice)
    engine.rootContext().setContextProperty('ice', ice)

    engine.load(QUrl("main.qml"))
    app.exec()

if __name__ == "__main__":
    main()
