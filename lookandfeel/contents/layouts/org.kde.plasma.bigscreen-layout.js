/*
    SPDX-FileCopyrightText: 2020 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2025 Seshan Ravikumar <seshan@sineware.ca>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

/**
 * Default Bigscreen Plasma layout configuration script.
 * Configures slideshow wallpaper and global shortcut bindings across all activity desktops.
 */
const desktopsArray = desktopsForActivity(currentActivity());

for (let j = 0; j < desktopsArray.length; j++) {
    const desk = desktopsArray[j];
    desk.wallpaperPlugin = "org.kde.slideshow";

    desk.currentConfigGroup = ["Wallpaper", "org.kde.slideshow", "General"];
    desk.writeConfig("SlideInterval", 480);
    desk.writeConfig("SlidePaths", "/usr/share/wallpapers/");

    if (j === 0) {
        // Add meta to home default shortcut
        desk.currentConfigGroup = ["Shortcuts"];
        desk.writeConfig("global", "Meta+F1");
    }
}
