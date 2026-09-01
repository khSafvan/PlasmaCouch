#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2024 Aditya Mehra <aix.m@outlook.com>
# SPDX-License-Identifier: GPL-2.0-or-later

set -euo pipefail

${XGETTEXT:-xgettext} $(find . -name '*.cpp' -o -name '*.h' -o -name '*.qml' -o -name '*.js') -o "${podir:-.}/kcm_mediacenter_display.pot"

