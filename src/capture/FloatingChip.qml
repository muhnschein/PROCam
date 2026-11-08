// SPDX-FileCopyrightText: 2026 RAWfish Contributors
// SPDX-License-Identifier: BSD-3-Clause

import QtQuick 2.0
import Sailfish.Silica 1.0
import com.procam.camera 1.0

// Small translucent button floating over the viewfinder: text, an icon, or
// three dots (menu) when neither is set.
MouseArea {
    id: chip

    property string text
    property string iconSource
    property bool checked
    // False when the chip's content is a child item instead.
    property bool menuDots: true

    implicitHeight: Theme.itemSizeExtraSmall
    implicitWidth: Math.max(implicitHeight,
                            (label.visible ? label.implicitWidth : icon.width) + 2 * Theme.paddingMedium)
    opacity: enabled ? 1.0 : Theme.opacityLow

    // Dark glass; a chip that is on is outlined and lettered in the accent.
    Rectangle {
        anchors.fill: parent
        radius: height / 2
        color: chip.pressed ? CameraStyle.glassPressed : CameraStyle.glass
        border.width: chip.checked ? CameraStyle.lineWidth : 0
        border.color: CameraStyle.accent
    }

    Label {
        id: label

        anchors.centerIn: parent
        visible: chip.text.length > 0
        text: chip.text
        font.family: CameraFonts.family
        font.pixelSize: Theme.fontSizeExtraSmall
        font.capitalization: Font.AllUppercase
        font.letterSpacing: CameraStyle.capsSpacing
        font.bold: true
        color: chip.checked ? CameraStyle.accent : CameraStyle.primaryText
    }

    Icon {
        id: icon

        anchors.centerIn: parent
        visible: !label.visible && chip.iconSource.length > 0
        width: Theme.iconSizeSmallPlus
        height: width
        source: chip.iconSource
        color: chip.checked ? CameraStyle.accent : CameraStyle.primaryText
    }

    Row {
        anchors.centerIn: parent
        visible: chip.menuDots && !label.visible && !icon.visible
        spacing: Theme.paddingSmall / 2

        Repeater {
            model: 3
            Rectangle {
                width: Math.round(Theme.paddingSmall * 1.2)
                height: width
                radius: width / 2
                color: Theme.lightPrimaryColor
            }
        }
    }
}
