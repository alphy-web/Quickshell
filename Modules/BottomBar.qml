import Quickshell
import QtQuick
import "../"
import "./Left"
import "./Center"
import "./Right"

PanelWindow {
    id: rootBar
    anchors {
        left: true
        right: true
        bottom: true
    }
    implicitHeight: 2
    aboveWindows: true
    exclusiveZone: 2
    color: "transparent"

    Left {
        id: leftBar
    }

    Center {
        id: centerBar
    }

    Right {
        id: rightBar
    }

    Row {
        layoutDirection: Qt.LeftToRight

        //LeftBar
        Rectangle {
            id: leftRect
            width: rootBar.width / 3
            height: 2

            color: Theme.mainBackground

            MouseArea {
                id: areaLeft
                anchors.fill: parent
                hoverEnabled: true

                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: mouse => {
                    if (mouse.button === Qt.LeftButton) {
                        leftBar.isOpen = !leftBar.isOpen;
                    }
                }
            }
        }

        //CenterBar
        Rectangle {
            id: centerRect
            width: rootBar.width / 3
            height: 2

            color: Theme.mainBackground

            MouseArea {
                id: areaCenter
                anchors.fill: parent
                hoverEnabled: true

                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: mouse => {
                    if (mouse.button === Qt.LeftButton) {
                        centerBar.visible = !centerBar.visible;
                    }
                }
            }
        }

        //RightBar
        Rectangle {
            id: rightRect
            width: rootBar.width / 3
            height: 2

            color: Theme.mainBackground

            MouseArea {
                id: areaRight
                anchors.fill: parent
                hoverEnabled: true

                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: mouse => {
                    if (mouse.button === Qt.LeftButton) {
                        rightBar.visible = !rightBar.visible;
                    }
                }
            }
        }
    }
}
