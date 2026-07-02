import Quickshell.Io
import QtQuick
import "../../../Theme/"

Item {
    width: 300
    height: 14

    Process {
        id: cpu
        property int lastIdle: 0
        property int lastTotal: 0
        property string cpuText: "loading..."

        command: ["sh", "-c", "cat /proc/stat | head -n1; " + "cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq; " + "cat /sys/class/hwmon/hwmon2/temp1_input"]

        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                let lines = text.trim().split("\n");

                // ----- CPU Usage -----
                let stat = lines[0].trim().split(/\s+/);

                let user = Number(stat[1]);
                let nice = Number(stat[2]);
                let system = Number(stat[3]);
                let idle = Number(stat[4]);
                let iowait = Number(stat[5]);
                let irq = Number(stat[6]);
                let softirq = Number(stat[7]);
                let steal = Number(stat[8]);

                let idleTime = idle + iowait;
                let totalTime = user + nice + system + idle + iowait + irq + softirq + steal;

                let usage = 0;

                if (cpu.lastTotal !== 0) {
                    let deltaIdle = idleTime - cpu.lastIdle;
                    let deltaTotal = totalTime - cpu.lastTotal;

                    usage = ((deltaTotal - deltaIdle) / deltaTotal) * 100;
                }

                cpu.lastIdle = idleTime;
                cpu.lastTotal = totalTime;

                // ----- Clock -----
                let ghz = (Number(lines[1]) / 1000000).toFixed(2);

                // ----- Temp -----
                let temp = (Number(lines[2]) / 1000).toFixed(0);

                cpu.cpuText = `${usage.toFixed(0)}% • ${temp}°C • ${ghz} GHz`;
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: cpu.running = true
    }

    Text {
        text: "CPU: " + cpu.cpuText
        font.pixelSize: 14
        font.family: "FreeMono"
        font.bold: true
        color: ColorScheme.mainText
    }
}
