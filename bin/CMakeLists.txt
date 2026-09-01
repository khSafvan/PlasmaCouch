# SPDX-FileCopyrightText: 2020 Bart Ribbers <bribbers@disroot.org>
# SPDX-FileCopyrightText: 2025 Seshan Ravikumar <seshan@sineware.ca>
# SPDX-FileCopyrightText: 2026 Safvan Khalifa <khalifasafvan@yahoo.com>
#
# SPDX-License-Identifier: GPL-2.0-or-later

configure_file(plasmacouch-wayland.in ${CMAKE_CURRENT_BINARY_DIR}/plasmacouch-wayland)
install(PROGRAMS
	${CMAKE_CURRENT_BINARY_DIR}/plasmacouch-wayland
	plasmacouch-common-env
	plasmacouch-swap-session
	DESTINATION ${KDE_INSTALL_BINDIR})

configure_file(plasmacouch-wayland.desktop.cmake ${CMAKE_CURRENT_BINARY_DIR}/plasmacouch-wayland.desktop)
configure_file(plasmacouch-swap-session.desktop.cmake ${CMAKE_CURRENT_BINARY_DIR}/plasmacouch-swap-session.desktop)

install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/plasmacouch-wayland.desktop
    DESTINATION ${KDE_INSTALL_DATADIR}/wayland-sessions
)

install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/plasmacouch-swap-session.desktop
	DESTINATION ${KDE_INSTALL_APPDIR}
)

# Dev session for PlasmaCouch developers
configure_file(plasmacouch-wayland-dev.in ${CMAKE_CURRENT_BINARY_DIR}/plasmacouch-wayland-dev)
configure_file(plasmacouch-wayland-dev.desktop.cmake ${CMAKE_CURRENT_BINARY_DIR}/plasmacouch-wayland-dev.desktop)
configure_file(install-sessions.sh.cmake ${CMAKE_CURRENT_BINARY_DIR}/install-sessions.sh)

