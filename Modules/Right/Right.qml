import Quickshell
import QtQuick
import QtQuick.Shapes
import "../../"
import "./RightModule/"

PanelWindow {
    id: rootRightBar
    implicitWidth: 530
    implicitHeight: 180
    anchors {
        bottom: true
        right: true
    }

    aboveWindows: true
    exclusiveZone: 0
    visible: false
    color: "transparent"

    ListView {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 500
        height: 150
        spacing: 2

        clip: true
        orientation: ListView.Vertical
        snapMode: ListView.SnapOneItem
        highlightMoveDuration: 100

        model: ListModel {
            ListElement {
                type: "time"
                titile: "thisTime"
            }
            ListElement {
                type: "notify"
                title: "Notification"
            }
        }

        delegate: DelegateChooser {
            role: "type"
            DelegateChoice {
                roleValue: "time"
                delegate: Time {}
            }

            DelegateChoice {
                roleValue: "notify"
                delegate: Rectangle {
                    width: 500
                    height: 150
                    topLeftRadius: 14
                    color: Theme.mainBackground
                }
            }
        }
    }

    Shape {
        width: 30
        height: 30
        anchors.top: parent.top
        anchors.right: parent.right
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            strokeWidth: 0
            fillColor: Theme.mainBackground

            startX: 30
            startY: 0

            PathArc {
                x: 0
                y: 30

                radiusX: 30
                radiusY: 30
                direction: PathArc.Clockwise
            }

            PathLine {
                x: 30
                y: 30
            }

            PathLine {
                x: 30
                y: 0
            }
        }
    }

    Shape {
        width: 30
        height: 30
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            strokeWidth: 0
            fillColor: Theme.mainBackground

            startX: 30
            startY: 0

            PathArc {
                x: 0
                y: 30

                radiusX: 30
                radiusY: 30
                direction: PathArc.Clockwise
            }

            PathLine {
                x: 30
                y: 30
            }

            PathLine {
                x: 30
                y: 0
            }
        }
    }
}
