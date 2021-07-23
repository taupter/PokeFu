import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11

Page {
    id: aboutPage
    width: 400
    height: 400
    title: qsTr("About")
    anchors.fill: parent

    Image {
        id: pokeball
        x: 53
        y: 56
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "images/pokeball-icon.svg"
        antialiasing: false
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        fillMode: Image.PreserveAspectFit
    }
}
