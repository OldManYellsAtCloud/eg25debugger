import QtQuick
import QtQuick.Window
import QtQuick.Controls

import sgy.pine.launcher

Window {
    width: 640
    height: 480
    visible: true
    id: root

    Eg25connection {
        id: modem
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "HomeScreen.qml"
    }
}
