// SPDX-FileCopyrightText: 2026 ProCam Contributors
//
// SPDX-License-Identifier: BSD-3-Clause

pragma Singleton
import QtQuick 2.0
import Sailfish.Silica 1.0

// Colours and type details of the camera's own controls floating over the
// viewfinder: one accent for whatever is on or selected, dark glass behind
// text, red only for recording. Text is set in D-DIN (CameraFonts).
QtObject {
    readonly property color accent: "#ffd54a"
    readonly property color record: "#ff453a"
    readonly property color glass: Theme.rgba("black", 0.45)
    readonly property color glassPressed: Theme.rgba("black", 0.65)
    readonly property color selectedFill: Theme.rgba("white", 0.14)
    readonly property color primaryText: Theme.lightPrimaryColor
    readonly property color secondaryText: Theme.rgba(Theme.lightPrimaryColor, 0.7)
    // Letter spacing for upper-case labels (tabs, chips).
    readonly property real capsSpacing: Math.round(1.4 * Theme.pixelRatio)
    readonly property real lineWidth: Math.max(2, Math.round(1.5 * Theme.pixelRatio))
}
