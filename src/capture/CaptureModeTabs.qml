// SPDX-FileCopyrightText: 2026 ProCam Contributors
// SPDX-License-Identifier: BSD-3-Clause

import QtQuick 2.0
import Sailfish.Silica 1.0
import com.procam.camera 1.0

// NIGHT | PHOTO | VIDEO | PRO above the shutter, as on Android cameras.
// NIGHT is listed only while night mode is offered (a dark scene). Swiping
// the viewfinder left/right switches photo and video too.
Row {
    id: root

    // "night", "photo", "video" or "pro".
    property string mode: "photo"
    property bool nightAvailable
    signal selected(string mode)

    readonly property var _tabs: {
        var tabs = []
        if (nightAvailable) tabs.push({ "mode": "night", "label": "Night" })
        tabs.push({ "mode": "photo", "label": "Photo" })
        tabs.push({ "mode": "video", "label": "Video" })
        tabs.push({ "mode": "pro", "label": "Pro" })
        return tabs
    }

    height: Theme.itemSizeExtraSmall
    spacing: Theme.paddingSmall
    opacity: enabled ? 1.0 : Theme.opacityLow

    Repeater {
        model: root._tabs

        MouseArea {
            readonly property bool active: modelData.mode === root.mode

            width: tabLabel.implicitWidth + 2 * Theme.paddingMedium
            height: root.height
            onClicked: if (!active) root.selected(modelData.mode)

            Rectangle {
                anchors.fill: parent
                radius: height / 2
                color: CameraStyle.glass
                opacity: parent.pressed ? 1.0 : 0.0
            }

            Label {
                id: tabLabel

                anchors.centerIn: parent
                text: modelData.label
                font.family: CameraFonts.family
                font.pixelSize: Theme.fontSizeSmall
                font.capitalization: Font.AllUppercase
                font.letterSpacing: CameraStyle.capsSpacing
                font.bold: true
                color: parent.active ? CameraStyle.accent : CameraStyle.secondaryText
                style: Text.Outline
                styleColor: "#20000000"
            }

            // The selected tab's mark under its label.
            Rectangle {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: tabLabel.bottom
                    topMargin: Theme.paddingSmall / 2
                }
                width: Theme.paddingLarge + Theme.paddingSmall
                height: CameraStyle.lineWidth
                radius: height / 2
                color: CameraStyle.accent
                visible: parent.active
            }
        }
    }
}
