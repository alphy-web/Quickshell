import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "../"

PanelWindow {
    id: workspace
    anchors {
        top: true
        right: true
        left: true
    }
    height: 10
    exclusiveZone: 5
    aboveWindows: false
    color: "transparent"

    Row {
        anchors.centerIn: parent
        spacing: 6

        Repeater {
            model: 10

            Rectangle {
                required property int index

                property bool active: Hyprland.focusedWorkspace?.id === index + 1

                width: active ? 20 : 6
                height: 6
                radius: 3

                color: Theme.workspace

                Behavior on width {
                    NumberAnimation {
                        duration: 150
                    }
                }
            }
        }
    }
}
