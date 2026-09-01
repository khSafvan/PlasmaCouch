# SPDX-FileCopyrightText: 2025 Devin Lin <devin@kde.org>
# SPDX-FileCopyrightText: 2026 Safvan Khalifa <khalifasafvan@yahoo.com>
# SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL

add_executable(plasmacouch-settings)

ecm_add_qml_module(plasmacouch-settings
    URI
    com.plasmacouch.settings
)

target_sources(plasmacouch-settings
    PRIVATE
    main.cpp
    kcmslistmodel.cpp
    module.cpp
    settingsapp.cpp
)

ecm_target_qml_sources(plasmacouch-settings
    SOURCES
    qml/Main.qml
    qml/ConfigWindowSidebar.qml
    qml/KCMContainer.qml
    qml/SidebarDelegate.qml
)

target_link_libraries(plasmacouch-settings
    PRIVATE
    Qt6::Quick
    Qt6::Qml
    Qt6::Gui
    Qt6::Widgets
    KF6::I18n
    KF6::CoreAddons
    KF6::KCMUtils
    KF6::IconThemes
    KF6::I18nQml
    KF6::WindowSystem
    KF6::DBusAddons
)

install(TARGETS plasmacouch-settings ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
install(PROGRAMS com.plasmacouch.settings.desktop DESTINATION ${KDE_INSTALL_APPDIR})

