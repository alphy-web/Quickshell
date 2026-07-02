import Quickshell
import QtQuick
import "../../../Theme/"

Item {
    width: 300
    height: 14

    SystemClock {
        id: calender
        precision: SystemClock.Hours
    }

    Text {
        text: "Calender: " + Qt.locale("id.ID").toString(calender.date, "dddd, dd MMMM yyyy")
        font.family: "FreeMono"
        font.bold: true
        font.pixelSize: 14
        color: ColorScheme.mainText
    }
}
