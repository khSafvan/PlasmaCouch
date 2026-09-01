# SPDX-FileCopyrightText: 2026 Devin Lin <devin@kde.org>
# SPDX-License-Identifier: GPL-2.0-or-later

add_executable(plasmacouch-inputhandler)
if (Qt6_VERSION VERSION_GREATER_EQUAL "6.8.0")
    set(private_code_option  "PRIVATE_CODE")
endif()

qt_generate_dbus_interface(
    ${CMAKE_CURRENT_SOURCE_DIR}/inputhandlerdbus.h
    com.plasmacouch.inputhandler.xml
    OPTIONS -s -m -P
)
qt_add_dbus_adaptor(inputhandler_dbus_SRCS
    ${CMAKE_CURRENT_BINARY_DIR}/com.plasmacouch.inputhandler.xml
    inputhandlerdbus.h
    InputHandlerDBus
)

target_sources(plasmacouch-inputhandler PRIVATE
    main.cpp
    controllermanager.cpp
    xdgremotedesktopsystem.cpp
    sdlcontroller.cpp
    device.cpp
    devicewatcher.cpp
    inputhandlerdbus.cpp
    ${inputhandler_dbus_SRCS}
)

kconfig_add_kcfg_files(plasmacouch-inputhandler GENERATE_MOC inputhandlersettings.kcfgc)

target_link_libraries(plasmacouch-inputhandler
    ${CMAKE_DL_LIBS}
    Qt::Core
    Qt::DBus
    Qt::Gui
    KF6::ConfigCore
    KF6::Notifications
    KF6::Solid
    KF6::I18n
    KF6::DBusAddons
    KF6::CoreAddons
    KF6::WindowSystem
    SDL3::SDL3
)
target_compile_definitions(plasmacouch-inputhandler PRIVATE -DPROJECT_VERSION="${PROJECT_VERSION}")

if (TARGET PkgConfig::Libcec)
    set(LIBCEC_SRCS
        libcec/ceccontroller.cpp
        libcec/ceccontroller.h
        libcec/cecworker.cpp
        libcec/cecworker.h
    )
    target_sources(plasmacouch-inputhandler PUBLIC ${LIBCEC_SRCS})
    target_link_libraries(plasmacouch-inputhandler PkgConfig::Libcec)
    add_definitions(-DHAS_LIBCEC)
endif()

install(TARGETS plasmacouch-inputhandler DESTINATION ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})

configure_file(com.plasmacouch.inputhandler.desktop.cmake ${CMAKE_CURRENT_BINARY_DIR}/com.plasmacouch.inputhandler.desktop @ONLY)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/com.plasmacouch.inputhandler.desktop DESTINATION ${KDE_INSTALL_APPDIR})

if (SYSTEMD_FOUND)
    install(FILES 40-uinput-uaccess.rules DESTINATION ${KDE_INSTALL_LIBDIR}/udev/rules.d RENAME 40-uinput.rules)
else()
    install(FILES 40-uinput-input-group.rules DESTINATION ${KDE_INSTALL_LIBDIR}/udev/rules.d RENAME 40-uinput.rules)
endif()
