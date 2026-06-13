import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Shapes
import QtQuick.Controls
import "../.."

PanelWindow {
    id: rootCenterBar
    implicitWidth: 530
    implicitHeight: 150
    anchors {
        bottom: true
    }

    aboveWindows: true
    exclusiveZone: 0
    visible: false
    color: "transparent"

    Rectangle {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 470
        height: 80
        topRightRadius: 14
        topLeftRadius: 14
        color: Theme.mainBackground

        ListView {
            anchors.centerIn: parent
            width: 450
            height: 80
            spacing: 10

            orientation: ListView.Horizontal
            clip: true

            model: DesktopEntries.applications.values.filter(app => !["bssh", "bvnc", "avahi-discover", "uuctl", "nm-connection-editor", "qv4l2", "qvidcap"].includes(app.id))
            delegate: Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                width: 60
                height: 60
                radius: 14
                color: Theme.backgroundApp

                IconImage {
                    anchors.centerIn: parent
                    width: 24
                    height: 25

                    source: Quickshell.iconPath(modelData.icon)
                    visible: modelData.icon ? true : false
                    Component.onCompleted: {
                        console.log("NAME:", modelData.name, "ID:", modelData.id, "ICON:", modelData.icon);
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        modelData.execute();
                    }
                }
            }
        }
    }
    Shape {
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.bottom: parent.bottom
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
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            strokeWidth: 0
            fillColor: Theme.mainBackground

            startX: 0
            startY: 0

            PathArc {
                x: 30
                y: 30

                radiusX: 30
                radiusY: 30
                direction: PathArc.Counterclockwise
            }

            PathLine {
                x: 0
                y: 30
            }

            PathLine {
                x: 0
                y: 0
            }
        }
    }
}
