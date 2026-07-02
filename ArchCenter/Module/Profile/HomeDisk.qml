import Quickshell.Io
import QtQuick
import "../../../Theme/"

Item {
    width: 300
    height: 14

    Process {
        id: storage
        property string storageText: "Loading..."

        command: ["df", "-h", "/home"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                let lines = text.trim().split("\n");

                if (lines.length < 2)
                    return;

                let cols = lines[1].trim().split(/\s+/);

                let total = cols[1];
                let used = cols[2];
                let percent = cols[4];

                storage.storageText = `${used} / ${total} (${percent})`;
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true

        onTriggered: storage.running = true
    }

    Text {
        text: "Disk (/home): " + storage.storageText
        font.pixelSize: 14
        font.family: "FreeMono"
        font.bold: true
        color: ColorScheme.mainText
    }
}
