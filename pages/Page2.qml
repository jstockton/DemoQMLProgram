import QtQuick 2.6
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0

Pane{
    id: pane1
    width: 800
    height: 480

    TextEdit {
        id: textEdit1
        x: 114
        y: 92
        width: 80
        height: 20
        text: qsTr("1 RPM")
        selectionColor: "#800000"
        font.pixelSize: 12
    }

    TextEdit {
        id: textEdit2
        x: 114
        y: 128
        width: 80
        height: 20
        text: qsTr("5 RPM")
        font.pixelSize: 12
    }

    TextEdit {
        id: textEdit3
        x: 114
        y: 164
        width: 80
        height: 20
        text: qsTr("10 RPM")
        font.pixelSize: 12
    }

    Label {
        id: label1
        x: 62
        y: 92
        text: qsTr("Motor 1")
    }

    Label {
        id: label2
        x: 61
        y: 128
        text: qsTr("Motor 2")
    }

    Label {
        id: label3
        x: 61
        y: 164
        text: qsTr("Motor 3")
    }

    Text {
        id: text1
        x: 41
        y: 21
        text: qsTr("Start time")
        font.pixelSize: 12
    }

    TextEdit {
        id: textEdit4
        x: 114
        y: 19
        width: 80
        height: 20
        text: qsTr("10:00 AM")
        font.pixelSize: 12
    }

    Label {
        id: label4
        x: 250
        y: 21
        text: qsTr("Run for")
    }

    TextEdit {
        id: textEdit5
        x: 300
        y: 19
        width: 80
        height: 20
        text: qsTr("30 min")
        font.pixelSize: 12
    }
}

