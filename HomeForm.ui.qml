import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.0

Page {
    id: homePage
    width: 600
    height: 400
    title: qsTr("Welcome to PokeFu!")
    anchors.fill: parent

    Rectangle {
        id: rectangle
        color: "#ffff00"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Item {
            id: topSpacer
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Image {
            id: pokemonLogo
            source: "images/pokemon-logo.svg"
            Layout.rightMargin: 20
            Layout.leftMargin: 20
            Layout.fillHeight: true
            Layout.fillWidth: true
            fillMode: Image.PreserveAspectFit
        }

        Item {
            id: bottomSpacer
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
