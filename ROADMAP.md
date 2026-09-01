# PlasmaCouch Roadmap & Architecture Scaffolding

This document outlines the planned technical direction for **PlasmaCouch** as a 10-foot, controller-first media and gaming interface.

---

## 1. Multi-Source Application Launching Architecture

### Phase 1: Native & Web Applications (Current Scaffolding)
- [x] Native Linux `.desktop` application discovery and categories.
- [x] WebApp viewer (`plasmacouch-webapp-viewer`) with QtWebEngine profiles and custom user-agents.
- [ ] Direct PWA installation from browser and settings sidebar.

### Phase 2: Wine & Proton Emulation
- [ ] Auto-discovery of installed Wine, Proton, and Bottles prefixes.
- [ ] Steam Big Picture and Heroic Games Launcher integration.
- [ ] Custom Wine launcher wrapper with controller overlay mapping.

### Phase 3: Android Applications via Waydroid
- [ ] Waydroid container status monitor and background session manager.
- [ ] Android `.apk` / intent launcher bridge for TV-compatible Android apps.
- [ ] Automatic controller-to-touch emulation mapping for Android navigation.

### Phase 4: Retro Gaming & Emulators
- [ ] RetroArch and standalone emulator (Dolphin, PCSX2, RPCS3) rom-list scanning.
- [ ] Gamepad guide button quick-access overlay menu.

---

## 2. Input & Navigation Enhancements
- [x] libcec TV Remote support via `plasmacouch-inputhandler`.
- [x] SDL3 game controller event processing.
- [ ] Per-app gamepad profile mapping.
- [ ] On-screen virtual keyboard with D-pad navigation and predictive text.

---

## 3. Media & Display Optimizations
- [ ] Automatic display mode & refresh rate switching (24Hz / 60Hz / 120Hz) for video playback.
- [ ] HDR (High Dynamic Range) toggle on supported Wayland compositors.
- [ ] CEC power-off and TV HDMI input switching on sleep/wake.
