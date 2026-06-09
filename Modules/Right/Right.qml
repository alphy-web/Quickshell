import Quickshell
import QtQuick
import "../.."

PanelWindow {
    id: rootRightBar
    implicitWidth: 533
    implicitHeight: 150
    anchors {
        bottom: true
        right: true
    }

    aboveWindows: true
    exclusiveZone: 0
    visible: false
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        topLeftRadius: 14
        color: Theme.mainBackground
    }
}
