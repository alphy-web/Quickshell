import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../../../Theme/"

Rectangle {
    width: 300
    height: 150
    color: "transparent"

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    property var today: clock.date
    property var firstDay: new Date(today.getFullYear(), today.getMonth(), 1)
    property int daysInMonth: new Date(today.getFullYear(), today.getMonth() + 1, 0).getDate()

    // Senin = 0
    property int startDay: (firstDay.getDay() + 6) % 7

    Column {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 4

        RowLayout {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: Qt.locale("id_ID").toString(today, "✈︎ ⋆°•☁︎MMMM yyyy‧₊˚ ☾. ⋅")
                color: ColorScheme.mainText
                font.pixelSize: 18
                font.bold: true
            }

            Item {
                Layout.fillWidth: true
            }

            Text {
                text: Qt.formatTime(today, "⋆˙⟡ HH:mm ☕︎")
                color: ColorScheme.mainText
                font.pixelSize: 18
                font.bold: true
            }
        }

        Grid {
            columns: 7
            spacing: 2

            Repeater {
                model: ["Sn", "Sl", "Rb", "Km", "Jm", "Sb", "Mg"]

                delegate: Text {
                    width: 40
                    horizontalAlignment: Text.AlignHCenter
                    text: modelData
                    color: "#bbbbbb"
                    font.bold: true
                    font.pixelSize: 12
                }
            }

            Repeater {
                model: 35

                delegate: Item {
                    width: 40
                    height: 18

                    property int day: index - startDay + 1

                    Text {
                        anchors.centerIn: parent
                        font.pixelSize: 11
                        color: ColorScheme.mainText

                        text: {
                            if (parent.day < 1 || parent.day > daysInMonth)
                                return "";

                            if (parent.day === today.getDate())
                                return "「✦" + parent.day + "✦」";//「 ✦ 𝐍𝐚𝐦𝐞 ✦ 」

                            return parent.day.toString();
                        }
                    }
                }
            }
        }
    }
}
