import Quickshell.Io
import QtQuick
import "../../../Theme/"

Item {
    width: 300
    height: 14

    Process {
        id: network
        property string networkText: "↓ 0 B/s ↑ 0 B/s"
        property double lastRx: 0
        property double lastTx: 0

        command: ["sh", "-c", "cat /sys/class/net/enp7s0/statistics/rx_bytes; \
             cat /sys/class/net/enp7s0/statistics/tx_bytes"]

        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                let lines = text.trim().split("\n");

                let rx = Number(lines[0]);
                let tx = Number(lines[1]);

                if (network.lastRx === 0) {
                    network.lastRx = rx;
                    network.lastTx = tx;
                    return;
                }

                let down = rx - network.lastRx;
                let up = tx - network.lastTx;

                network.lastRx = rx;
                network.lastTx = tx;

                function formatSpeed(bytes) {
                    if (bytes >= 1024 * 1024 * 1024)
                        return (bytes / 1024 / 1024 / 1024).toFixed(2) + " GB/s";

                    if (bytes >= 1024 * 1024)
                        return (bytes / 1024 / 1024).toFixed(2) + " MB/s";

                    if (bytes >= 1024)
                        return (bytes / 1024).toFixed(1) + " KB/s";

                    return bytes + " B/s";
                }

                network.networkText = `↓ ${formatSpeed(down)} ↑ ${formatSpeed(up)}`;
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: network.running = true
    }

    Text {
        text: "Network: " + network.networkText
        font.pixelSize: 14
        font.family: "FreeMono"
        font.bold: true
        color: ColorScheme.mainText
    }
}
