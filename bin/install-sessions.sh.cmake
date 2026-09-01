#!/bin/sh
# SPDX-FileCopyrightText: 2019 Aleix Pol Gonzalez <aleixpol@kde.org>
# SPDX-FileCopyrightText: 2021 Nate Graham <nate@kde.org>
# SPDX-FileCopyrightText: 2022 Devin Lin <devin@kde.org>
#
# SPDX-License-Identifier: GPL-2.0-or-later

set -eu

# Step 1: Install wayland session desktop file and binary for login managers
echo "Installing wayland-dev session desktop file..."
sudo install -m 644 "@CMAKE_CURRENT_BINARY_DIR@/plasmacouch-wayland-dev.desktop" /usr/share/wayland-sessions/

echo "Installing wayland-dev launcher binary..."
install -m 755 "@CMAKE_CURRENT_BINARY_DIR@/plasmacouch-wayland-dev" "@CMAKE_INSTALL_FULL_LIBEXECDIR@"

# Step 2: Make system D-Bus able to see new D-Bus files added to the built session.
# Because some distributions have security policies preventing D-Bus file usage
# from user homedirs, files are mirrored into /opt/kde-dbus-scripts/
echo "Configuring D-Bus system overrides..."
sudo mkdir -p /opt/kde-dbus-scripts/

if [ -d "@KDE_INSTALL_FULL_DBUSDIR@" ]; then
    sudo cp -r "@KDE_INSTALL_FULL_DBUSDIR@"/* /opt/kde-dbus-scripts/ 2>/dev/null || true
fi

# Step 3: Create session-local D-Bus config if not already present
if [ ! -f /etc/dbus-1/session-local.conf ]; then
    TMP_CONF="$(mktemp)"
    trap 'rm -f "${TMP_CONF}"' EXIT

    cat > "${TMP_CONF}" << 'EOF'
<busconfig>
	<servicedir>/opt/kde-dbus-scripts/services</servicedir>
	<servicedir>/opt/kde-dbus-scripts/system-services</servicedir>
	<includedir>/opt/kde-dbus-scripts/system.d/</includedir>
	<includedir>/opt/kde-dbus-scripts/interfaces/</includedir>
</busconfig>
EOF

    sudo install -m 644 "${TMP_CONF}" /etc/dbus-1/session-local.conf
    rm -f "${TMP_CONF}"
    trap - EXIT
fi

echo "Session installation complete."

