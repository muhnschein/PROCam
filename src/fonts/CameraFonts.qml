// SPDX-FileCopyrightText: 2026 ProCam Contributors
//
// SPDX-License-Identifier: BSD-3-Clause

pragma Singleton
import QtQuick 2.0
import Sailfish.Silica 1.0

// D-DIN (Datto Inc., OFL-1.1) for the camera's own UI text: viewfinder
// chips, mode tabs, zoom and timer readouts. Both faces register the same
// "D-DIN" family, so font.bold picks the Bold file. Until the files load,
// or if they are missing, text keeps the Sailfish theme font.
QtObject {
    readonly property FontLoader regular: FontLoader { source: "D-DIN.ttf" }
    readonly property FontLoader bold: FontLoader { source: "D-DIN-Bold.ttf" }

    readonly property string family: regular.status === FontLoader.Ready
                                     ? regular.name : Theme.fontFamily
}
