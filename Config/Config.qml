pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    property alias matugenIndex: config.matugenIndex
    property alias transitionType: config.transitionType

    FileView {
        id: file

        path: Qt.resolvedUrl("../config.json")
        blockLoading: true

        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: config

            property int matugenIndex: 0
            property string transitionType: "any"
        }
    }
}
