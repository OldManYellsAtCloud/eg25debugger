import QtQuick
import QtQuick.Controls


Item {
    id: root
    anchors.fill: parent
    TextField {
        id: pinInput
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
                height: ((parent.height - pinInput.height) / 4)
                width: (parent.width / 3)
                required property int index
                text: getButtonText(index)
                font.bold: true
                font.pixelSize: 20
                onClicked: {
                    if (text === "<") {
                        pinInput.text = deleteLastChar(pinInput.text)
                    } else {
                        pinInput.text = pinInput.text + text;
                    }
                }
            }
        }
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
