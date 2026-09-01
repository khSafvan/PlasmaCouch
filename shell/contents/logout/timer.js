/*
    SPDX-FileCopyrightText: 2018 David Edmundson <davidedmundson@kde.org>

    SPDX-License-Identifier: GPL-2.0-or-later
*/

.pragma library

// Written as a library singleton to share knowledge of when a key was pressed
// between multiple views, so pressing a key on one cancels all timers.

const callbacks = [];

/**
 * Registers a callback function to be executed when auto-trigger is cancelled.
 *
 * @param {Function} callback - The callback function to invoke on cancellation.
 */
function addCancelAutoTriggerCallback(callback) {
    callbacks.push(callback);
}

/**
 * Triggers all registered cancellation callbacks and executes them safely.
 */
function cancelAutoTrigger() {
    callbacks.forEach(callback => {
        if (typeof callback === "function") {
            callback();
        }
    });
}

