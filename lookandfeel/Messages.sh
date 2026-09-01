#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2019 Marco Martin <mart@kde.org>
# SPDX-FileCopyrightText: 2019 Aditya Mehra <aix.m@outlook.com>
# SPDX-License-Identifier: GPL-2.0-or-later

set -euo pipefail

${XGETTEXT:-xgettext} $(find . -name '*.qml' -o -name '*.js') -L Java -o "${podir:-.}/plasma_lookandfeel_org.kde.plasma.bigscreen.pot"
rm -f rc.cpp

