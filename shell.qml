import Quickshell
import Quickshell.Io
import QtQuick
import "./Wallpaper/"
import "./State/" as Toggle

ShellRoot {
    id: archieRoot

    IpcHandler {
        target: "wallpaper"

        function wallpaperToggle() {
            Toggle.State.shown = !Toggle.State.shown;
            console.log("Toggle: ", Toggle.State.shown);
        }
    }

    Chooser {
        visible: Toggle.State.shown
    }
}
