import Quickshell
import Quickshell.Io
import QtQuick
import "../../../Theme/"

Item {
    width: 300
    height: 14

    Process {
        id: uptime
        property string uptimeText: "loading..."

        command: ["cat", "/proc/uptime"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                let seconds = parseFloat(text.split(" ")[0]);

                let days = Math.floor(seconds / 86400);
                let hours = Math.floor((seconds % 86400) / 3600);
                let minutes = Math.floor((seconds % 3600) / 60);

                let result = "";

                if (days > 0)
                    result += days + "d ";

                if (hours > 0 || days > 0)
                    result += hours + "h ";

                result += minutes + "m";

                uptime.uptimeText = result;
            }
        }
    }

    Timer {
        interval: 60000
        running: true
        repeat: true

        onTriggered: uptime.running = true
    }

    Text {
        text: "UpTime: " + uptime.uptimeText
        font.pixelSize: 14
        font.family: "FreeMono"
        font.bold: true
        color: ColorScheme.mainText
    }
}
