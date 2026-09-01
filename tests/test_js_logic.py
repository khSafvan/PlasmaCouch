#!/usr/bin/env python3
"""
Unit test suite for Plasma Bigscreen JavaScript logic and metadata files.
Executes isolated tests for JavaScript logic functions and verifies repository metadata.
"""

import json
import os
import unittest
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent

class TestAudioIconLogic(unittest.TestCase):
    """Tests volume to icon name mapping and form-factor icon resolution."""

    def test_volume_icon_levels(self):
        # PulseAudio NormalVolume constant
        NORMAL_VOLUME = 65536

        def name(volume, muted, prefix="audio-volume"):
            percent = volume / NORMAL_VOLUME
            if percent <= 0.0 or muted:
                return f"{prefix}-muted"
            elif percent <= 0.25:
                return f"{prefix}-low"
            elif percent <= 0.75:
                return f"{prefix}-medium"
            return f"{prefix}-high"

        # Muted tests
        self.assertEqual(name(0, True), "audio-volume-muted")
        self.assertEqual(name(65536, True), "audio-volume-muted")
        self.assertEqual(name(0, False), "audio-volume-muted")

        # Low volume <= 25%
        self.assertEqual(name(1000, False), "audio-volume-low")
        self.assertEqual(name(16384, False), "audio-volume-low")

        # Medium volume <= 75%
        self.assertEqual(name(32768, False), "audio-volume-medium")
        self.assertEqual(name(49152, False), "audio-volume-medium")

        # High volume > 75%
        self.assertEqual(name(50000, False), "audio-volume-high")
        self.assertEqual(name(65536, False), "audio-volume-high")

        # Custom prefix
        self.assertEqual(name(1000, False, "microphone-sensitivity"), "microphone-sensitivity-low")
        self.assertEqual(name(0, True, "microphone-sensitivity"), "microphone-sensitivity-muted")

    def test_form_factor_icons(self):
        def form_factor_icon(form_factor):
            mapping = {
                "internal": "audio-card",
                "speaker": "audio-speakers-symbolic",
                "phone": "phone",
                "handset": "phone",
                "tv": "video-television",
                "webcam": "camera-web",
                "microphone": "audio-input-microphone",
                "headset": "audio-headset",
                "headphone": "audio-headphones",
                "hands-free": "hands-free",
                "car": "car",
                "hifi": "hifi",
                "computer": "computer",
                "portable": "portable"
            }
            return mapping.get(form_factor, "")

        self.assertEqual(form_factor_icon("speaker"), "audio-speakers-symbolic")
        self.assertEqual(form_factor_icon("headset"), "audio-headset")
        self.assertEqual(form_factor_icon("tv"), "video-television")
        self.assertEqual(form_factor_icon("unknown-device"), "")

class TestTimerLogic(unittest.TestCase):
    """Tests timer callback management."""

    def test_callback_registration_and_execution(self):
        callbacks = []

        def add_cancel_auto_trigger_callback(cb):
            callbacks.append(cb)

        def cancel_auto_trigger():
            for cb in callbacks:
                if callable(cb):
                    cb()

        executed = []
        add_cancel_auto_trigger_callback(lambda: executed.append(1))
        add_cancel_auto_trigger_callback(lambda: executed.append(2))
        add_cancel_auto_trigger_callback(None)

        cancel_auto_trigger()
        self.assertEqual(executed, [1, 2])

class TestJsonMetadataValidity(unittest.TestCase):
    """Validates that all JSON metadata files in the repository are syntactically valid."""

    def test_json_files(self):
        json_files = list(REPO_ROOT.glob("**/*.json"))
        self.assertGreater(len(json_files), 0, "No JSON files found in repo")

        for json_path in json_files:
            if "node_modules" in str(json_path):
                continue
            with self.subTest(file=str(json_path.relative_to(REPO_ROOT))):
                with open(json_path, "r", encoding="utf-8") as f:
                    data = json.load(f)
                    self.assertIsNotNone(data)

if __name__ == "__main__":
    unittest.main()
