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

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.1

Window {
    visible: true
    title: qsTr("Brightness adjuster")
    id: mainwindow

    SystemPalette { id: palette; colorGroup: SystemPalette.Active }
    color: palette.window

    Connections {
        target: tray
        onActivated: {
            mainwindow.visible = !mainwindow.visible
        }
    }

    Component.onCompleted: {
        items.clear();
        var screens = xrandr.listScreens();
        for(var i = 0; i < screens.length; i++) {
            items.append({devname: screens[i], index: i})
        }
    }

    ListView {
        anchors.fill: parent

        ScrollBar.vertical: ScrollBar { }

        model: items

        ListModel {
            id: items
        }

        delegate: Selector {
            device: devname
            width: parent.width
        }
    }

    Settings {
        id: settings
        property alias x: mainwindow.x
        property alias y: mainwindow.y
        property alias width: mainwindow.width
        property alias height: mainwindow.height
    }
}
