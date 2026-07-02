import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import "../../Theme/"
import "./Profile/"
import "./Profile/Time/"

ClippingRectangle {
    id: profilePage
    width: 300
    height: 150
    border.color: ColorScheme.mainBackground
    border.width: 1
    radius: 14
    color: Qt.rgba(0, 0, 0, 0.5)

    ListView {
        width: parent.width
        height: parent.height
        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem
        spacing: 10

        model: ListModel {
            ListElement {
                name: "Profile"
            }

            ListElement {
                name: "Time"
            }

            ListElement {
                name: "Calender"
            }
        }

        delegate: DelegateChooser {
            role: "name"
            DelegateChoice {
                roleValue: "Profile"
                delegate: Rectangle {
                    width: 300
                    height: 150
                    radius: 14
                    color: "transparent"

                    Column {
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.top: parent.top
                        anchors.topMargin: 4
                        width: 300
                        height: 150
                        spacing: 0

                        Text {
                            text: "Archie • alphy@ArchPhy"
                            font.pixelSize: 14
                            font.family: "FreeMono"
                            font.bold: true
                            color: ColorScheme.mainText
                        }

                        Network {}
                        Uptime {}
                        Memory {}
                        Disk {}
                        HomeDisk {}
                        GPU {}
                        CPU {}
                        Clock {}
                        Calender {}
                    }
                }
            }

            DelegateChoice {
                roleValue: "Time"
                delegate: Rectangle {
                    width: 300
                    height: 150
                    radius: 14
                    color: "transparent"

                    Time {}
                }
            }

            DelegateChoice {
                roleValue: "Calender"
                delegate: Rectangle {
                    width: 300
                    height: 150
                    radius: 14
                    color: "blue"
                }
            }
        }
    }
}
