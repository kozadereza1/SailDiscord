import QtQuick 2.0
import Sailfish.Silica 1.0
import io.thp.pyotherside 1.5
import "../components"

Page {
    id: page
    allowedOrientations: Orientation.All

    property string serverid
    property string name

    SilicaListView {
        model: model
        anchors.fill: parent

        header: PageHeader {
            title: name
        }

        delegate: ListItem {
            width: parent.width

            SectionHeader {
                id: sectionHeader
                text: categoryid == -1? qsTr("No category") : name
            }

            SilicaListView { // TODO: add model for a specefic category here
                model: sectionModel
                anchors {
                    top: sectionHeader.bottom
                    //bottom: parent.bottom
                }

                width: parent.width

                delegate: ListItem {
                    width: parent.width
                    height: Theme.itemSizeLarge
                    Label {
                        text: channelName

                        Component.onCompleted: {
                            console.log("Label "+channelName+" initialised!")
                        }
                    }
                }
            }

            ListModel {
                id: sectionModel

                Component.onCompleted: {
                    sectionModel.append({channelId: "-2", channelName: "hello2"})
                    sectionModel.append({channelId: "-3", channelName: "hello3"})
                    sectionModel.append({channelId: "-4", channelName: "hello4"})
                    python.setHandler('channel'+serverid+" "+categoryid, function (_id, _name, _haspermissions) {
                        if (!_haspermissions && !appSettings.ignorePrivate) return;
                        //sectionModel.append({channelId: _id, channelName: _name})
                        //console.log("ALERT: nothing much but "+sectionModel.count)
                    })
                    python.requestChannels(serverid, categoryid)
                }
            }
        }
    }

    ListModel {
        id: model

        Component.onCompleted: {
            python.setHandler('category', function (_serverid, _id, _name, _haspermissions) {
                if ((_serverid != serverid) || (!_haspermissions && !appSettings.ignorePrivate)) return;
                append({categoryid: _id, name: _name})
            })
            python.requestCategories(serverid)
        }
    }
}
