import QtQuick 2.6
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0

Pane{
    id: pane1
    width: 800
    height: 480

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
        text: qsTr("10 hrs")
        font.pixelSize: 12
    }
}

