pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    property color mainBackground: colorScheme.mainBackground
    property color mainText: colorScheme.mainText
    property color mainBorder: colorScheme.mainBorder
    property color secondBackground: colorScheme.secondBackground

    FileView {
        id: color
        path: "/home/alphy/.cache/quickshell/colors.json"
        watchChanges: true
        onFileChanged: reload()

        onLoaded: {
            console.log("=== FILE JSON BERHASIL DI-LOAD VIA DISK ===");
            console.log("BG Baru:", colorScheme.mainBackground);
            console.log("Text Baru:", colorScheme.mainText);
        }

        // Tangkap jika file JSON korup / salah ketik sintaksis
        onLoadFailed: error => {
            console.log("Gagal membaca JSON:", error);
        }
        JsonAdapter {
            id: colorScheme

            property color mainBackground: "#7c580d"
            property color mainText: "#814d78"
            property color mainBorder: "#a3d0bf"
            property color secondBackground: "#a3d0bf"
        }
    }
}
