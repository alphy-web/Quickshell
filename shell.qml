import Quickshell
import Quickshell.Io
import QtQuick
import "./Wallpaper/"
import "./ArchCenter/"
import "./State/" as Toggle

ShellRoot {
    id: archieRoot

    IpcHandler {
        target: "archie"

        function wallpaperToggle() {
            Toggle.State.shown = !Toggle.State.shown;
            console.log("Toggle: ", Toggle.State.shown);
        }

        function controlToggle() {
            Toggle.State.controlShown = !Toggle.State.controlShown;
        }
    }

    Chooser {
        visible: Toggle.State.shown
    }

    ControlCenter {
        visible: Toggle.State.controlShown
    }
}
