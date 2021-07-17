import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    id: page
    width: 600
    height: 400
    title: qsTr("Welcome to PokeFu!")



    Rectangle {
        id: rectangle
        color: "#ffff00"
        anchors.fill: parent
    }

    Label {
        text: qsTr("Welcome to PokeFu!")
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.verticalCenterOffset: -150
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
    }



    Image {
        id: international_Pokmon_logo
        anchors.fill: parent
        source: "images/International_Pokémon_logo.svg"
        fillMode: Image.PreserveAspectFit
    }

}
