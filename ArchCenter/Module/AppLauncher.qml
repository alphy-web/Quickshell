import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import "../../State/"
import "../../Theme/"

Rectangle {
    id: launcher

    width: 300
    height: 500
    radius: 14

    border.width: 1
    border.color: ColorScheme.mainBackground
    color: Qt.rgba(0, 0, 0, 0.5)

    property string query: ""

    Column {
        anchors.fill: parent
        anchors.topMargin: 5
        spacing: 10

        TextField {
            id: searchField
            anchors.horizontalCenter: parent.horizontalCenter
            width: 290
            height: 50

            placeholderText: "Search Applications..."
            placeholderTextColor: ColorScheme.mainText
            color: ColorScheme.mainText
            font.pixelSize: 16

            background: Rectangle {
                radius: 14
                border.width: 1
                border.color: ColorScheme.mainBackground
                color: "transparent"
            }

            onTextChanged: {
                launcher.query = text;
                appList.currentIndex = filterApps.values.length > 0 ? 0 : -1;
            }
        }

        ScriptModel {
            id: filterApps

            values: {
                const allEntries = [...DesktopEntries.applications.values];
                const q = launcher.query.trim().toLowerCase();

                if (q === "") {
                    return allEntries;
                }

                return allEntries.filter(d => d.name && d.name.toLowerCase().includes(q));
            }
        }

        ListView {
            id: appList

            width: 290
            height: 430

            spacing: 10
            clip: true

            model: filterApps
            currentIndex: filterApps.values.length > 0 ? 0 : -1

            delegate: Rectangle {
                width: 290
                height: 50

                radius: 14
                color: "transparent"
                border.width: 1
                border.color: appArea.containsMouse ? ColorScheme.mainBackground : "transparent"

                Row {
                    anchors.fill: parent
                    spacing: 10

                    Text {
                        anchors.centerIn: parent
                        text: modelData.name
                        color: ColorScheme.mainText
                        font.pixelSize: 16
                    }
                }

                MouseArea {
                    id: appArea

                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        console.log("Open App:", modelData.name);
                        modelData.execute();
                    }
                }
            }
        }
    }
}
