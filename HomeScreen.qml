import QtQuick
import QtQuick.Controls

Item {
    id: homeScreen
    anchors.fill: parent

    Text {
        id: homeScreenTitle
        anchors.horizontalCenter: parent.horizontalCenter
        height: 20
        font.pixelSize:20
        font.bold: true
        text: "Modem Toolkit"
    }

    Button {
        id: unlockSimButton
        anchors.top: homeScreenTitle.bottom
        text: "Unlock SIM"
        font.pixelSize: 15
        width: parent.width / 3
        height: 45
        onClicked: {
            stackView.push("SimUnlock.qml")
        }
    }

    Button {
        anchors.top: homeScreenTitle.bottom
        anchors.left: unlockSimButton.right
        text: "Network"
        font.pixelSize: 15
        width: parent.width / 3
        height: 45
        onClicked: {
            modem.connectToNetwork()
        }
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        text: qsTr("Quit")
        font.pixelSize: 15
        height: 45
        onClicked: {
            Qt.quit()
        }
    }
}
