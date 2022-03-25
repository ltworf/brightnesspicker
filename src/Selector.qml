/*
brightnesspicker
Copyright (C) 2022 Salvo "LtWorf" Tomaselli

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

author Salvo "LtWorf" Tomaselli <tiposchi@tiscali.it>
*/

import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

ColumnLayout {

    property alias device: devname.text

    RowLayout {
        Label {
            text: qsTr("Device")
        }

        Label {
            id: devname
            Layout.fillWidth: true
        }


    }
    RowLayout {
        Label {
            text: qsTr("Brightness")
        }

        Slider {
            Layout.fillWidth: true
            orientation: Qt.Horizontal
            id: brightness
            stepSize: 0.05
            from: 0.001
            to: 2
            value: 1

            onValueChanged: {
                xrandr.setBrightness(devname.text, brightness.value)
            }
            Component.onCompleted: xrandr.setBrightness(devname.text, brightness.value)
        }

        Button {
            onClicked: brightness.value = 1
            text: qsTr("Reset")
        }
    }
}
