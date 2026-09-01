// SPDX-FileCopyrightText: 2019 Marco Martin <mart@kde.org>
// SPDX-FileCopyrightText: 2024 Aditya Mehra <aix.m@outlook.com>
// SPDX-License-Identifier: GPL-2.0-or-later

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami

Image {
    id: image
    width: 900
    height: 600
    source: "https://source.unsplash.com/random"

    GridView {
        id: view
        anchors.fill: parent

        cellWidth: 300
        cellHeight: cellWidth / 2
        model: [
            "desktop", "firefox", "vlc", "blender", "applications-games",
            "blinken", "adjustlevels", "cuttlefish", "calligrakrita",
            "folder-games", "applications-network", "applications-utilities",
            "view-left-close", "accessories-dictionary", "calligraflow",
            "multimedia-player", "calligraauthor"
        ]

        delegate: Item {
            id: delegate
            width: view.cellWidth
            height: view.cellHeight

            Rectangle {
                anchors.fill: parent
                anchors.margins: 10
                radius: 5
                color: palette.dominantContrast

                Kirigami.ImageColors {
                    id: palette
                    source: modelData
                }

                RowLayout {
                    anchors.fill: parent

                    Kirigami.Icon {
                        id: icon
                        Layout.preferredHeight: delegate.height * 0.8
                        Layout.preferredWidth: Layout.preferredHeight
                        Layout.leftMargin: y
                        source: modelData
                    }

                    Kirigami.Heading {
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        text: "Lorem"
                        color: Kirigami.Theme.textColor
                    }
                }
            }
        }
    }
}


