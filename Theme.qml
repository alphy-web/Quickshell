pragma Singleton
import Quickshell.Io

FileView {
    id: theme
    path: "/home/alphy/.cache/quickshell/colors.json"

    watchChanges: true
    onFileChanged: reload()

    JsonAdapter {
        id: colors
        property string mainBackground: "#101417"
        property string workspace: "#c9beff"
    }

    property alias mainBackground: colors.mainBackground
    property alias workspace: colors.workspace
}
