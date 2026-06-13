import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import "../../../"

Rectangle {
    width: 500
    height: 150
    topRightRadius: 14
    color: Theme.mainBackground

    property var players: Mpris.players.values[0]

    Column {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 5
        anchors.leftMargin: 10
        spacing: 5

        Text {
            id: title
            width: 50
            anchors.horizontalCenter: parent.horizontalCenter
            text: players?.trackArtist ?? ""
            color: "white"
        }

        Text {
            width: 300
            text: players?.trackTitle ?? "No Music"
            color: "white"

            wrapMode: Text.NoWrap
            elide: Text.ElideRight
        }

        Row {}
    }

    Row {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 10
        anchors.topMargin: 10

        Rectangle {
            width: 170
            height: 140
            color: "blue"
        }
    }
}
