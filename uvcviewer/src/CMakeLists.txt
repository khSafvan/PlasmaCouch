# SPDX-FileCopyrightText: 2025 Seshan Ravikumar <seshan@sineware.ca>
# SPDX-FileCopyrightText: 2026 Safvan Khalifa <khalifasafvan@yahoo.com>
# SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
add_executable(plasmacouch-uvcviewer)

ecm_add_qml_module(plasmacouch-uvcviewer
    URI
    com.plasmacouch.uvcviewer
)

target_sources(plasmacouch-uvcviewer
    PRIVATE
    main.cpp
)

ecm_target_qml_sources(plasmacouch-uvcviewer
    SOURCES
    Main.qml
    UvcViewer.qml
    CameraHomePage.qml
)

target_link_libraries(plasmacouch-uvcviewer
    PRIVATE
    Qt6::Quick
    Qt6::Qml
    Qt6::Gui
    Qt6::Widgets
    KF6::I18n
    KF6::CoreAddons
    KF6::IconThemes
)

install(TARGETS plasmacouch-uvcviewer ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})

