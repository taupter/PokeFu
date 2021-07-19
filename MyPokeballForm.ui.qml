import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    id: myPokeballPage
    width: 600
    height: 400
    title: qsTr("My pokeball")
    anchors.fill: parent


    Label {
        text: qsTr("This is your pokeball.")
        anchors.centerIn: parent
    }
}
