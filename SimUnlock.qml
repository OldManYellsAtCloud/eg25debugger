import QtQuick
import QtQuick.Controls


Item {
    id: root
    anchors.fill: parent
    Button {
        id: unlockBackButton
        text: qsTr("Back")
        onClicked: {
            stackView.pop()
        }
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 50
        font.pixelSize: 20
    }

    Rectangle {
        id: filler
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: unlockBackButton.bottom
        height: (parent.height / 3) - unlockBackButton.height
        Text {
            text: qsTr("Enter the %1 code to unlock the SIM card. %2 tries left.".arg("PIN").arg(3))
            anchors.left: filler.left
            anchors.right: filler.right
            anchors.bottom: filler.bottom
            font.pixelSize: 20
            color: "black"
            wrapMode: Text.WordWrap
        }
    }

    TextField {
        id: pinInput
        anchors.top: filler.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        rightPadding: 15
        leftPadding: 15
        height: 40
        readOnly: true
        font.bold: true
        font.pixelSize: 20
    }

    Grid {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: pinInput.bottom
        anchors.bottom: parent.bottom
        columns: 3
        columnSpacing: 5
        rowSpacing: 5
        Repeater {
            model: 12
            delegate: Button {
                required property int index
                height: ((parent.height - pinInput.height) / 4)
                width: (parent.width / 3)
                text: getButtonText(index)
                font.bold: true
                font.pixelSize: 20
                onClicked: {
                    if (text === "<") {
                        pinInput.text = deleteLastChar(pinInput.text)
                    } else if (text === "OK") {
                        modem.unlockSim(pinInput.text)
                    } else {
                        pinInput.text = pinInput.text + text;
                    }
                }
            }
        }
    }

    Dialog {
        id: wrongPinDialog
        title: qsTr("Wrong PIN!")
        standardButtons: Dialog.Ok
        anchors.centerIn: parent
    }

    function getButtonText(index){
        switch(index){
            case 9:
                return "<"
            case 10:
                return 0
            case 11:
                return "OK"
            default:
                return index + 1
        }
    }

    function deleteLastChar(str){
        if (str.length === 0){
            return str;
        }
        return str.substr(0, str.length - 1);
    }
}
