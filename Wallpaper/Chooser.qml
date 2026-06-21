import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import Qt.labs.folderlistmodel
import "../State/" as Buffer
import "../State/" as Toggle
import "../Config/"
import "../Theme/"

PanelWindow {
    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    aboveWindows: true
    focusable: true
    color: Qt.rgba(0, 0, 0, 0.5)

    IndexChooser {}

    FolderListModel {
        id: pathWallpaper
        folder: "file:///home/alphy/Pictures/Wallpapers/"
        nameFilters: ["*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp"]
        showDirs: false
    }

    Process {
        id: wallpaperChoice
    }

    Process {
        id: matugen

        onExited: function (exitCode) {
            console.log("Matugen selesai:", exitCode);
        }
    }

    ListView {
        id: listImage
        anchors.centerIn: parent
        width: 1400
        height: 750
        orientation: ListView.Horizontal
        spacing: 10
        snapMode: ListView.SnapOneItem
        highlightMoveDuration: 250
        clip: true
        focus: true

        model: pathWallpaper

        delegate: ClippingRectangle {
            width: 1400
            height: 750
            radius: 32
            color: "darkblue"

            Image {
                anchors.fill: parent
                source: fileUrl
                fillMode: Image.PreserveAspectCrop
                cache: true
            }
        }

        Keys.onPressed: function (event) {
            if (event.key === Qt.Key_Escape) {
                Toggle.State.shown = false;
                console.log("toggle state off: ", Toggle.State.shown);
            } else if (event.key === Qt.Key_Return) {
                let path = pathWallpaper.get(currentIndex, "filePath");
                wallpaperChoice.command = ["awww", "img", path, "--transition-type", Config.transitionType];
                wallpaperChoice.running = true;
                matugen.command = ["matugen", "image", path, "--source-color-index", Config.matugenIndex];
                matugen.running = true;
            } else if (event.key === Qt.Key_Up) {
                if (Config.matugenIndex < 3) {
                    Config.matugenIndex += 1;
                    console.log(Config.matugenIndex);
                }
            } else if (event.key === Qt.Key_Down) {
                if (Config.matugenIndex > 0) {
                    Config.matugenIndex -= 1;
                    console.log(Config.matugenIndex);
                }
            }
        }
    }
    TransitionWallpaper {}
}
