#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Zack / KDE Community
# SPDX-License-Identifier: GPL-2.0-or-later

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "=== Plasma Bigscreen Verification & Test Suite ==="

# Step 1: Shell Scripts Syntax Verification
echo "--> [1/3] Checking Shell Script Syntax (bash -n)..."
mapfile -t SHELL_SCRIPTS < <(find "${REPO_ROOT}" -type f \( -name "Messages.sh" -o -name "*.sh" -o -path "*/bin/plasma-bigscreen*" \) -not -path "*/.git/*" -not -name "*.desktop*")

for script in "${SHELL_SCRIPTS[@]}"; do
    bash -n "${script}"
    echo "    ✓ ${script#"${REPO_ROOT}/"}"
done

# Step 2: Ensure Executable Permissions on Binaries
echo "--> [2/3] Verifying Script Permissions..."
for script in "${REPO_ROOT}/bin/plasma-bigscreen-common-env" "${REPO_ROOT}/bin/plasma-bigscreen-swap-session" "${REPO_ROOT}/scripts/verify-all.sh"; do
    if [ -f "${script}" ]; then
        chmod +x "${script}"
        echo "    ✓ Executable: ${script#"${REPO_ROOT}/"}"
    fi
done

# Step 3: Run Unit Tests and JSON Metadata Validation
echo "--> [3/3] Running Logic Unit Tests & JSON Metadata Validation..."
python3 "${REPO_ROOT}/tests/test_js_logic.py"

echo "=== All checks passed successfully! ==="
