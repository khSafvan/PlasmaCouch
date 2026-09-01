/*
    SPDX-FileCopyrightText: 2014-2015 Harald Sitter <sitter@kde.org>

    SPDX-License-Identifier: LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-KDE-Accepted-LGPL
*/

/**
 * Returns an audio icon name based on volume level and mute state.
 *
 * @param {number} volume - Current volume level value.
 * @param {boolean} muted - Whether the audio device is muted.
 * @param {string} [prefix="audio-volume"] - Icon name prefix (e.g., "audio-volume" or "microphone-sensitivity").
 * @param {number} [maxVolume=65536] - Maximum volume scaling factor.
 * @returns {string} The icon theme name corresponding to the volume level.
 */
function name(volume, muted, prefix = "audio-volume", maxVolume = 65536) {
    const percent = volume / maxVolume;

    if (percent <= 0.0 || muted) {
        return `${prefix}-muted`;
    } else if (percent <= 0.25) {
        return `${prefix}-low`;
    } else if (percent <= 0.75) {
        return `${prefix}-medium`;
    }
    return `${prefix}-high`;
}

/**
 * Returns an icon name representing the device form factor.
 *
 * @param {string} formFactor - The form factor type identifier.
 * @returns {string} The icon name for the specified form factor.
 */
function formFactorIcon(formFactor) {
    switch (formFactor) {
        case "internal":
            return "audio-card";
        case "speaker":
            return "audio-speakers-symbolic";
        case "phone":
        case "handset":
            return "phone";
        case "tv":
            return "video-television";
        case "webcam":
            return "camera-web";
        case "microphone":
            return "audio-input-microphone";
        case "headset":
            return "audio-headset";
        case "headphone":
            return "audio-headphones";
        case "hands-free":
            return "hands-free";
        case "car":
            return "car";
        case "hifi":
            return "hifi";
        case "computer":
            return "computer";
        case "portable":
            return "portable";
        default:
            return "";
    }
}
 
