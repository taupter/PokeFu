import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    width: 600
    height: 400
    title: "My pokeball"


    Label {
        text: qsTr("This is your pokeball.")
        anchors.centerIn: parent
    }
}
