import Quickshell
import QtQuick
import "../State/"
import "./Module/"

PanelWindow {
    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    aboveWindows: true
    focusable: true
    color: Qt.rgba(0, 0, 0, 0.8)

    Column {
        anchors.left: parent.left
        anchors.top: parent.top
        width: 300
        height: 650
        spacing: 0

        Performance {}
        AppLauncher {}
    }

    Music {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }

    Dashboard {
        anchors.right: parent.right
    }
}
