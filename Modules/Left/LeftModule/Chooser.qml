import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import QtQuick
import Qt.labs.folderlistmodel
import "../../../"

ClippingRectangle {
    anchors.bottom: parent.bottom
    width: 500
    height: 150
    topRightRadius: 14
    color: Theme.mainBackground
    clip: true

    Process {
        id: matugenProcess
    }

    Process {
        id: wallpaperScript
    }

    ListView {
        id: listImage
        width: 480
        height: 125
        anchors.centerIn: parent

        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        spacing: 10

        model: FolderListModel {
            id: wallpaperModel
            folder: "file:///home/alphy/Pictures/Wallpapers"
            nameFilters: ["*.jpg", "*.png", "*.jpeg", "*.webp"]
            showDirs: false
        }

        delegate: ClippingRectangle {
            width: 240
            height: 125
            radius: 14
            color: Theme.mainBackground

            Image {
                anchors.fill: parent
                source: model.filePath
                fillMode: Image.PreserveAspectCrop
            }

            MouseArea {
                id: wallpaperArea
                anchors.fill: parent
                onClicked: {
                    matugenProcess.command = ["matugen", "image", filePath, "--source-color-index", "0"];
                    matugenProcess.running = true;

                    wallpaperScript.command = ["awww", "img", filePath, "--transition-type", "any", "--transition-duration", "2"];
                    wallpaperScript.running = true;
                }
            }
        }
    }
}
