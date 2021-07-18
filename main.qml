import QtQuick 2.15
import QtQuick.Controls 2.15

import QtQuick.LocalStorage 2.12
import Qt.labs.settings 1.1

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Pokefu")

    property var dataBase

    Settings {
        id: settings
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height

        property int pokemons: 0
        property var dataBase
        property var m_pokenon
    }


    function pokefuDataBase()
    {
        var db = LocalStorage.openDatabaseSync("PokeFu", "1.0", "PokeFu Database", 1000000);
        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Pokedex(id INTEGER NOT NULL PRIMARY KEY, name TEXT NOT NULL, base_experience INTEGER NOT NULL, image BLOB)');
        })
/*        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Pokeball(id INTEGER NOT NULL PRIMARY KEY, name TEXT NOT NULL, base_experience INTEGER NOT NULL, image BLOB)');
        })
*/        return db;
    }

    Component.onCompleted: {
        dataBase = pokefuDataBase()
        console.log(dataBase.version)
        var pokelist = getPokemonList()
/*        for (var i = 1; i < pokelist.count; i++) {
            var pokemon = getPokemonInfo(i)
            console.log(pokemon.id+"    "+pokemon.name+"    "+pokemon.base_experience)
        }*/
    }


    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("My pokeball")
                width: parent.width
                onClicked: {
                    stackView.push("MyPokeballForm.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Exchange calculator")
                width: parent.width
                onClicked: {
                    stackView.push("ExchangeCalculatorForm.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Pokedex")
                width: parent.width
                onClicked: {
                    stackView.push("PokedexForm.ui.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.ui.qml"
        anchors.fill: parent
    }

    function getPokemonList()
    {
        var ret = {}
        var http = new XMLHttpRequest()
        var url = "https://pokeapi.co/api/v2/pokemon/?limit=20&offset=0"
        console.log("Vixe")
        http.open("GET", url, false); // true: asynchronous, false: synchronous

        http.onreadystatechange = function() { // Call a function when the state changes.
                    if (http.readyState == 4) {
                        ret.httpstatus = http.status
                        if (http.status == 200) {
                            console.log("ok")
                            ret = JSON.parse(http.responseText);
                            ret.httpstatus = http.status
                        } else {
                            console.log("error: " + http.status)
                        }
                    }
                }
        http.send();
//        console.log(http.responseText)
//        console.log(ret)
        console.log(ret.length)
        console.log(ret.count)
        return ret
    }

    function getPokemonInfo(id)
    {
        var ret = {}
        var http = new XMLHttpRequest()
        var url = "https://pokeapi.co/api/v2/pokemon/"+id
//        console.log("Vixe")
        http.open("GET", url, false); // true: asynchronous, false: synchronous

        http.onreadystatechange = function() { // Call a function when the state changes.
                    if (http.readyState == 4) {
                        ret.httpstatus = http.status
                        if (http.status == 200) {
//                            console.log("ok")
                            ret = JSON.parse(http.responseText);
                            ret.httpstatus = http.status
                        } else {
                            console.log("error: " + http.status)
                        }
                    }
                }
        http.send();
//        console.log(http.responseText)
//        console.log(ret.id)
//        console.log(ret.name)
//        console.log(ret.base_experience)
        return ret
    }
}
