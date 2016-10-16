import QtQuick 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

ApplicationWindow{
    id: window
    width: 800
    height: 480
    visible: true
    title: "Demo"

    header: ToolBar {
        Material.foreground: "white"

        RowLayout {
            anchors.fill: parent

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "images/drawer.png"
                }
                onClicked: drawer.open()
            }

            Label {
                id: titleLabel
                text: "Main"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            Text {
                id: timeDisplay
                horizontalAlignment: Qt.AlignRight
                font.pixelSize: 13
                font.bold: true
                text: Qt.formatTime(new Date(), "hh:mm")
            }

            Timer {
                id: timer
                interval: 10000
                repeat: true
                running: true

                onTriggered:
                {
                    timeDisplay.text = Qt.formatTime(new Date(), "hh:mm")
                }
            }

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "images/menu.png"
                }

                onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Settings"
                        onTriggered: settingsPopup.open()
                    }
                    MenuItem {
                        text: "About"
                        onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }

    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height

        ListView {
            id: listView
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    if (listView.currentIndex != index) {
                        listView.currentIndex = index
                        titleLabel.text = model.title
                        stackView.replace(model.source)
                    }
                    drawer.close()
                }
            }

            model: ListModel {
                ListElement { title: "Page 1"; source: "qrc:/pages/Page1.qml" }
                ListElement { title: "Motors"; source: "qrc:/pages/Page2.qml" }
                ListElement { title: "Light"; source: "qrc:/pages/Page3.qml" }
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill:   parent
        initialItem: Qt.resolvedUrl("pages/Page1.qml")
    }
}
