import Quickshell
import QtQuick
import "../../../Theme/"

Item {
    width: 300
    height: 14

    SystemClock {
        id: clockId
        precision: SystemClock.Seconds
    }

    Text {
        text: "Clock: " + Qt.formatTime(clockId.date, "hh:mm:ss")
        font.family: "FreeMono"
        font.bold: true
        font.pixelSize: 14
        color: ColorScheme.mainText
    }
}
