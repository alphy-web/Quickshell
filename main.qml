import Quickshell
import QtQuick
import "./Modules"
import "./Wallpapers"

ShellRoot {
    id: archieRoot
    PanelWindow {
        id: panelArchie
        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        aboveWindows: false
        color: "transparent"

        TopBar {}
        BottomBar {}
    }
}
