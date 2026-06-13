import Quickshell
import QtQuick
import QtQuick.Shapes
import "../.."
import "./LeftModule"

PanelWindow {
    id: rootLeftBar
    implicitWidth: 530
    implicitHeight: 180
    anchors {
        bottom: true
        left: true
    }

    aboveWindows: true
    color: "transparent"

    property bool isOpen: false
    property bool isWindowActive: false
    visible: isWindowActive

    onIsOpenChanged: {
        if (isOpen) {
            isWindowActive = true;
        }
    }

    Item {
        id: container
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: isOpen ? 530 : 0
        height: isOpen ? 180 : 0
        clip: true

        opacity: rootLeftBar.isOpen ? 1 : 0
        // y: rootLeftBar.isOpen ? 0 : 60

        Behavior on width {
            NumberAnimation {
                duration: 250
                easing.type: Easing.InOutCubic
            }
        }

        Behavior on height {
            NumberAnimation {
                duration: 250
                easing.type: Easing.InOutCubic

                onRunningChanged: {
                    if (!running && !rootLeftBar.isOpen) {
                        rootLeftBar.isWindowActive = false;
                    }
                }
            }
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 250
            }
        }

        ListView {
            id: listBar
            anchors.bottom: parent.bottom
            width: 500
            height: 150
            spacing: 2

            clip: true
            orientation: ListView.Vertical
            snapMode: ListView.SnapOneItem
            highlightMoveDuration: 100

            model: ListModel {
                ListElement {
                    type: "wallpaper"
                    title: "Desktop Wallpaper"
                }
                ListElement {
                    type: "music"
                    title: "Archie music"
                }
            }

            delegate: DelegateChooser {
                role: "type"

                DelegateChoice {
                    roleValue: "music"
                    delegate: Music {}
                }

                DelegateChoice {
                    roleValue: "wallpaper"
                    delegate: Chooser {}
                }
            }
        }

        Shape {
            width: 30
            height: 30
            anchors.top: parent.top
            anchors.left: parent.left
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

        Shape {
            width: 30
            height: 30
            anchors.bottom: parent.bottom
            anchors.right: parent.right
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
}
