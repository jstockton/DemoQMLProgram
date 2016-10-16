import QtQuick 2.6
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0

// What syntax is needed to import a js file when running from a .py file?
// import "ice.js" as ice

// I found the following but if I put the alias in the resource file it does not show in the project folder structure
// https://forum.qt.io/topic/7721/qml-and-javascript-files-in-resource-qrc-how-to-import-js-in-qml/10

Pane{
    id: pane1
    width: 800
    height: 480

    property string temp

    Text {
        id: temperature
        x: 11
        y: 62
        text:  "100"

        font.pixelSize: 150
    }

    Timer {
        id: timer
        interval: 5000
        repeat: true
        running: true

        onTriggered:
        {
            //Update temperature by getting values from DHT11 on Raspberry PI
        }
    }
}
