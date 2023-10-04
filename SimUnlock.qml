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
    }

    Grid {
        columns: 3
        Repeater {
            model: 10
            delegate: Button {
                padding: 5
                height: ((parent.height - pinInput.height) / 4) * 0.95
                width: (parent.width / 3) * 0.95
                required property int index
                text: index
            }
        }

    }
}
