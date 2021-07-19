import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11

Page {
    id: scratchPadPage
    width: 400
    height: 400
    property alias pokemonSearchButton: pokemonSearchButton
    title: qsTr("Scratch Pad")
    anchors.fill: parent

    RowLayout {
        x: 103
        y: 43

        TextField {
            id: textField
            placeholderText: qsTr("Text Field")
        }

        Button {
            id: pokemonSearchButton
            text: qsTr("Search")
        }
    }
}
