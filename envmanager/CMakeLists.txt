# SPDX-FileCopyrightText: 2023 Devin Lin <devin@kde.org>
# SPDX-License-Identifier: GPL-2.0-or-later

set(plasmacouch-envmanager_SRCS
    main.cpp
    settings.cpp
    utils.cpp
    config.h
)

add_executable(plasmacouch-envmanager ${plasmacouch-envmanager_SRCS})
target_link_libraries(plasmacouch-envmanager
    Qt::Qml
    Qt::Gui
    Qt::Widgets
    Qt::Quick
    KF6::I18n
    KF6::ConfigCore
    KF6::ConfigGui
    KF6::CoreAddons
    KF6::DBusAddons
    KF6::Package
)

target_include_directories(plasmacouch-envmanager PRIVATE ${CMAKE_BINARY_DIR})
install(TARGETS plasmacouch-envmanager ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})


