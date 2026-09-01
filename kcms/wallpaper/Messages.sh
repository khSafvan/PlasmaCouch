#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2025 Devin Lin <devin@kde.org>
# SPDX-License-Identifier: GPL-2.0-or-later

set -euo pipefail

${XGETTEXT:-xgettext} $(find . -name '*.cpp' -o -name '*.h' -o -name '*.qml' -o -name '*.js') -o "${podir:-.}/kcm_mediacenter_wallpaper.pot"

