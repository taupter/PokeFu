import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    width: 600
    height: 400
    title: "Pokedex"


    Label {
        text: qsTr("This is the Pokedex.")
        anchors.centerIn: parent
    }

    TextInput {
        id: textInput
        x: 214
        y: 246
        width: 80
        height: 20
        text: qsTr("Text Input")
        font.pixelSize: 12
    }

    Button {
        id: button
        x: 335
        y: 246
        text: qsTr("Button")
    }

    ToolBar {
        id: toolBar
        x: 108
        y: 59
        width: 360
    }
}
