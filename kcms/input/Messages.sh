#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Devin Lin <devin@kde.org>
# SPDX-License-Identifier: CC0-1.0

set -euo pipefail

${XGETTEXT:-xgettext} $(find . -name '*.cpp' -o -name '*.h' -o -name '*.qml' -o -name '*.js') -o "${podir:-.}/kcm_mediacenter_input.pot"

