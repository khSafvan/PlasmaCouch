import js from "@eslint/js";

export default [
  js.configs.recommended,
  {
    files: ["**/*.js", "**/*.mjs"],
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: "module",
      globals: {
        // Qt / Plasma QML Globals
        PulseAudio: "readonly",
        BluezQt: "readonly",
        i18n: "readonly",
        i18nc: "readonly",
        desktopsForActivity: "readonly",
        currentActivity: "readonly",
        console: "readonly"
      }
    },
    rules: {
      "no-unused-vars": ["warn", { "argsIgnorePattern": "^_" }],
      "no-undef": "off",
      "no-var": "error",
      "prefer-const": "error",
      "semi": ["error", "always"],
      "quotes": ["error", "double", { "avoidEscape": true }]
    }
  }
];
