import Quickshell
import QtQuick
import "../.."

PanelWindow {
    id: rootCenterBar
    implicitWidth: 533
    implicitHeight: 150
    anchors {
        bottom: true
    }

    aboveWindows: true
    exclusiveZone: 0
    visible: false
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        topRightRadius: 14
        topLeftRadius: 14
        color: Theme.mainBackground
    }
}
