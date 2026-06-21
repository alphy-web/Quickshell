import Quickshell
import Quickshell.Widgets
import QtQuick
import "../Config/"
import "../Theme/"

Rectangle {
    id: kotak
    anchors.bottom: parent.bottom
    width: 300
    height: mouse.containsMouse ? 300 : 50
    radius: 14
    color: ColorScheme.mainBackground

    Behavior on height {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutBack
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
    }

    ListView {
        anchors.fill: parent
        snapMode: ListView.SnapToItem
        orientation: ListView.Vertical
        clip: true
        spacing: 10

        model: ListModel {
            ListElement {
                transition: "simple"
            }
            ListElement {
                transition: "fade"
            }
            ListElement {
                transition: "left"
            }
            ListElement {
                transition: "right"
            }
            ListElement {
                transition: "top"
            }
            ListElement {
                transition: "bottom"
            }
            ListElement {
                transition: "wipe"
            }
            ListElement {
                transition: "wave"
            }
            ListElement {
                transition: "grow"
            }
            ListElement {
                transition: "center"
            }
            ListElement {
                transition: "any"
            }
            ListElement {
                transition: "outer"
            }
            ListElement {
                transition: "random"
            }
        }

        delegate: ClippingRectangle {
            required property string transition
            width: 300
            height: 50
            color: "transparent"
            border.color: ColorScheme.mainBorder
            border.width: 2
            radius: 14

            Text {
                anchors.centerIn: parent
                text: Config.transitionType === transition ? "「 ✦ " + transition + " ✦ 」" : transition
                color: ColorScheme.mainText
                font.pixelSize: 20
                font.bold: true
            }

            MouseArea {
                id: transitionChooser
                anchors.fill: parent
                onClicked: {
                    Config.transitionType = transition;
                    console.log(Config.transitionType);
                }
            }
        }
    }
}
