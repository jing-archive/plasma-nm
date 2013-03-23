/*
    Copyright 2012-2013  Jan Grulich <jgrulich@redhat.com>

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) version 3, or any
    later version accepted by the membership of KDE e.V. (or its
    successor approved by the membership of KDE e.V.), which shall
    act as a proxy defined in Section 6 of version 3 of the license.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 1.1
import org.kde.qtextracomponents 0.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasmanm 0.1 as PlasmaNm

Item {
    id: trayIcon;

    PlasmaCore.Svg {
        id: svgIcons;

        multipleImages: true;
        imagePath: "icons/plasma-nm";
    }

    PlasmaCore.SvgItem {
        id: connectionIcon;

        anchors.fill: parent;
        svg: svgIcons;
        elementId: "network-wired";

        QIconItem {
            id: vpnIcon;

            width: parent.width/1.5; height: parent.height/1.5;
            anchors { bottom: parent.bottom; right: parent.right }
            icon: QIcon("object-locked");
            visible: false;
        }

        PlasmaComponents.BusyIndicator {
            id: busyIndicator;

            anchors.fill: parent;
            running: false
            visible: running;
        }

        MouseArea {
            id: mouseArea

            anchors.fill: parent
            hoverEnabled: true
            onClicked: plasmoid.togglePopup()
        }

        PlasmaNm.ConnectionIcon {
            id: connectionIconProvider;

            onHideConnectingIndicator: {
                busyIndicator.running = false;
            }

            onShowConnectingIndicator: {
                busyIndicator.running = true;
            }

            onSetConnectionIcon: {
                connectionIcon.elementId = icon
            }

            onSetVpnIcon: {
                vpnIcon.visible = true;
            }

            onUnsetVpnIcon: {
                vpnIcon.visible = false;
            }
        }

        Component.onCompleted: {
            connectionIconProvider.init();
        }
    }
}
