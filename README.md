# PlasmaCouch

[![License: GPL-2.0-or-later](https://img.shields.io/badge/License-GPL%202.0%2B-blue.svg)](LICENSES/GPL-2.0-or-later.txt)
[![KDE Frameworks](https://img.shields.io/badge/KF6-6.14.0%2B-brightgreen.svg)](https://kde.org)
[![Qt](https://img.shields.io/badge/Qt-6.10.0%2B-green.svg)](https://www.qt.io)

PlasmaCouch is an open-source, Wayland-native 10-foot UI designed for TV screens, living room HTPCs, and gaming consoles. Built for game controllers and TV remotes, it provides a centralized interface for launching native Linux applications, web applications, Wine/Proton games, and Android applications via Waydroid.

### Key Features
- **Remote & Controller First**: Native CEC TV Remote and SDL3 game controller navigation with auto-suppression and rumble.
- **Multi-Source Launching**: Unified app discovery for native desktop apps, webapps/PWAs, Wine/Proton titles, and Waydroid apps.
- **Living Room Applications**: Integrated standalone settings app, camera/input viewer, and WebApp runtime.
- **Modular Shell**: Lightweight media-center overlay, status indicators, audio output switcher, and virtual keyboard support.

---

## Installation & Build

Build and install using CMake (single command block):

```bash
git clone https://github.com/khSafvan/plasma-bigscreen.git && cd plasma-bigscreen && cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr && cmake --build build && sudo cmake --install build
```

<details>
<summary><b>Building with kde-builder (Alternative)</b></summary>

```bash
kde-builder plasmacouch
```
See the [Building and Testing Locally](https://invent.kde.org/plasma/plasma-bigscreen/-/wikis/Building-and-Testing-Locally) wiki for details on managing development prefixes.
</details>

---

## Development & Live-Reload Setup

### Prerequisites
- **Qt 6**: `Qt6::Core`, `Qt6::Quick`, `Qt6::Qml`, `Qt6::DBus`, `Qt6::Network`, `Qt6::Multimedia`, `Qt6::WebEngineCore`, `Qt6::WaylandClient`
- **KDE Frameworks 6**: `KF6::Kirigami`, `KF6::I18n`, `KF6::KCMUtils`, `KF6::BluezQt`, `KF6::KIO`, `KF6::Notifications`, `KF6::WindowSystem`, `KF6::Svg`
- **System Libraries**: `SDL3`, `libcec` (>= 6.0), `systemd`

### Running PlasmaCouch in a Window
To test the shell locally inside a Wayland nested window session:

```bash
#!/usr/bin/env bash
export QT_QUICK_CONTROLS_STYLE=org.kde.breeze
export QT_ENABLE_GLYPH_CACHE_WORKAROUND=1
export QT_QUICK_CONTROLS_MOBILE=true
export PLASMA_INTEGRATION_USE_PORTAL=1
export PLASMA_PLATFORM=mediacenter
export QT_FILE_SELECTORS=mediacenter
export XDG_CONFIG_DIRS="$HOME/.config/plasmacouch:$HOME/.config/plasma-bigscreen:/etc/xdg${XDG_CONFIG_DIRS:+:$XDG_CONFIG_DIRS}"

QT_QPA_PLATFORM=offscreen plasmacouch-envmanager --apply-settings
export PLASMA_DEFAULT_SHELL=org.kde.plasma.bigscreen
dbus-run-session kwin_wayland "plasmashell -p org.kde.plasma.bigscreen"
```

### Running Input Handler Daemon
```bash
PLASMA_PLATFORM=mediacenter plasmacouch-inputhandler
```

### Live-Reload & Rapid QML Testing
> [!NOTE]
> Native C++/QML desktop environments do not include an out-of-the-box live reload daemon.

For rapid development and auto-reloading of QML components during iteration, use `plasmoidviewer` with a file watcher (e.g., `nodemon` or `entr`):

```bash
# Watch homescreen containment and reload on file change
npx nodemon --watch containments/homescreen -e qml,js --exec 'plasmoidviewer -a containments/homescreen/package'
```

### Quality & Verification Suite
Run the test and verification runner (validates shell scripts, JSON metadata, and JavaScript logic):

```bash
./scripts/verify-all.sh
```

Or via npm:

```bash
npm test
npm run lint
npm run format:check
```

---

## Roadmap & Architecture Scaffolding
See [ROADMAP.md](ROADMAP.md) for details on planned features, including:
- Wine/Proton launcher integration
- Waydroid Android container discovery and controller touch-mapping
- RetroArch and emulator rom scanning
- HDR and dynamic refresh rate switching

---

## License & Credits

### Upstream Project & Attribution
This project is an independent fork of [Plasma Bigscreen](https://invent.kde.org/plasma/plasma-bigscreen) originally created and maintained by the **KDE Community**.

- **Original Project Homepage**: [plasma-bigscreen.org](https://plasma-bigscreen.org)
- **Original Upstream Repository**: [invent.kde.org/plasma/plasma-bigscreen](https://invent.kde.org/plasma/plasma-bigscreen)
- **Original Authors & Contributors**:
  - Aditya Mehra (<aix.m@outlook.com>)
  - Marco Martin (<mart@kde.org>)
  - Devin Lin (<devin@kde.org>)
  - Aleix Pol Gonzalez (<aleixpol@kde.org>)
  - Bart Ribbers (<bribbers@disroot.org>)
  - Yuri Chornoivan
  - Harald Sitter (<sitter@kde.org>)
  - Seshan Ravikumar (<seshan@sineware.ca>)
  - Jonah Brüchert (<jbb@kaidan.im>)
  - And all contributors to the KDE Project (see [NOTICE.md](NOTICE.md)).

### Trademark Disclaimer
PlasmaCouch is an independent community project and is **not** endorsed by, affiliated with, or an official product of **KDE e.V.** or the **KDE Community**.
- "KDE", "KDE Plasma", and "Plasma" are registered trademarks of **KDE e.V.**
- All other trademarks and logos are the property of their respective owners.

### Fork Information
- **Fork Maintainer**: Safvan Khalifa ([@khSafvan](https://github.com/khSafvan))
- **Fork Repository**: [github.com/khSafvan/plasma-bigscreen](https://github.com/khSafvan/plasma-bigscreen)

### License
All source code in this repository is licensed under the original licensing terms:
- C++ / QML source and components: **GNU General Public License v2.0 or later** ([GPL-2.0-or-later](LICENSES/GPL-2.0-or-later.txt)) / **GNU Lesser General Public License v2.1 or later** ([LGPL-2.1-or-later](LICENSES/LGPL-2.1-or-later.txt)).
- Artwork, documentation, and configuration files: **CC-BY-SA-4.0** / **CC0-1.0** ([LICENSES/](LICENSES)).
- See individual file headers and `.reuse/` metadata for specific SPDX identifier tags.
