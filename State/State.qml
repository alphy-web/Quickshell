pragma Singleton

import QtQuick
import Quickshell

Singleton {
    //property wallpaper
    property bool shown: false

    //property
    property bool controlShown: false

    //property AppLauncher
    property var apps: DesktopEntries.applications
}
