import Quickshell
import QtQuick
import "../Config/"
import "../Theme/"

Rectangle {
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 200
    height: 50
    radius: 12
    color: "transparent"

    GridView {
        id: indexList
        width: 200
        height: 50
        cellWidth: 50
        cellHeight: 50

        model: ListModel {
            ListElement {
                name: "index 1"
                value: 0
            }

            ListElement {
                name: "index 2"
                value: 1
            }
            ListElement {
                name: "index 3"
                value: 2
            }

            ListElement {
                name: "index 4"
                value: 3
            }
        }

        delegate: Rectangle {
            required property int value
            width: 50
            height: 50
            radius: 12
            color: Config.matugenIndex === value ? ColorScheme.secondBackground : ColorScheme.mainBackground

            Behavior on color {
                ColorAnimation {
                    duration: 250
                    easing.type: Easing.BezierSpline
                }
            }

            Text {
                anchors.centerIn: parent
                text: value
                font.pixelSize: 20
                color: ColorScheme.mainText
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Config.matugenIndex = value;
                    console.log(Config.matugenIndex);
                }
            }
        }
    }
}
