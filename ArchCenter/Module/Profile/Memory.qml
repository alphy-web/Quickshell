import Quickshell.Io
import QtQuick
import "../../../Theme/"

Item {
    width: 300
    height: 14

    Process {
        id: memory
        property string memoryText: "Loading..."

        command: ["cat", "/proc/meminfo"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                let total = 0;
                let available = 0;

                for (let line of text.split("\n")) {
                    if (line.startsWith("MemTotal:"))
                        total = parseInt(line.match(/\d+/)[0]);

                    if (line.startsWith("MemAvailable:"))
                        available = parseInt(line.match(/\d+/)[0]);
                }

                let used = total - available;

                let usedGB = (used / 1024 / 1024).toFixed(1);
                let totalGB = (total / 1024 / 1024).toFixed(1);

                memory.memoryText = `${usedGB} / ${totalGB} GB`;
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: memory.running = true
    }

    Text {
        text: "Memory: " + memory.memoryText
        font.pixelSize: 14
        font.family: "FreeMono"
        font.bold: true
        color: ColorScheme.mainText
    }
}
