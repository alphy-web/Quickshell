import Quickshell.Io
import QtQuick
import "../../../Theme/"

Item {
    width: 300
    height: 14

    Process {
        id: gpu
        property string gpuText: "Loading..."

        command: ["sh", "-c", "cat /sys/class/drm/card1/device/mem_info_vram_used; " + "cat /sys/class/drm/card1/device/mem_info_vram_total; " + "cat /sys/class/drm/card1/device/gpu_busy_percent; " + "cat /sys/class/drm/card1/device/hwmon/hwmon*/temp1_input"]

        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                let data = text.trim().split("\n");

                let usedMB = (Number(data[0]) / 1024 / 1024).toFixed(0);
                let totalMB = (Number(data[1]) / 1024 / 1024).toFixed(0);
                let busy = Number(data[2]);
                let temp = (Number(data[3]) / 1000).toFixed(0);

                gpu.gpuText = `${usedMB}/${totalMB} MB (${busy}%) • ${temp}°C`;
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: gpu.running = true
    }

    Text {
        text: "GPU: " + gpu.gpuText
        font.pixelSize: 14
        font.family: "FreeMono"
        font.bold: true
        color: ColorScheme.mainText
    }
}
