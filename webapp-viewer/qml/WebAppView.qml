// SPDX-FileCopyrightText: 2014-2015 Sebastian Kügler <sebas@kde.org>
// SPDX-FileCopyrightText: 2025 Devin Lin <devin@kde.org>
// SPDX-License-Identifier: GPL-2.0-or-later

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts

import org.kde.kirigami as Kirigami
import com.plasmacouch.webapp as WebApp

WebView {
    id: webEngineView
    property string userAgent

    onUserAgentChanged: WebApp.UserAgent.userAgent = userAgent

    profile: WebApp.WebProfile {
        httpUserAgent: WebApp.UserAgent.userAgent
        offTheRecord: false
        storageName: "plasmacouch-webapp"

        onHttpUserAgentChanged: console.log("User agent set: " + httpUserAgent)
    }

    isAppView: true

    onNewWindowRequested: {
        Qt.openUrlExternally(request.requestedUrl);
    }
}
