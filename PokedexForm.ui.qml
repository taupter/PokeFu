import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.0

Page {
    id: pokedexPage
    width: 600
    height: 400
    property alias pokemonSearchButton: pokemonSearchButton
    title: qsTr("Pokedex")
    anchors.fill: parent

    Label {
        text: qsTr("This is the Pokedex.")
        anchors.centerIn: parent
    }

    RowLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.rightMargin: 42
        anchors.leftMargin: 40

        TextField {
            id: pokemonSearchField
            Layout.fillWidth: true
            Layout.preferredHeight: 47
            Layout.preferredWidth: 362
            placeholderText: qsTr("Pokemon name or ID")
        }

        Button {
            id: pokemonSearchButton
            text: "Search"
            display: AbstractButton.TextBesideIcon
        }
    }
}
