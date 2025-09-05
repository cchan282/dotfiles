# Firefox Configuration

This directory contains Firefox user preferences to customize browser behavior.

## Files

### user.js
Contains custom Firefox preferences that override default settings.

**Current settings:**
- `ui.key.menuAccessKeyFocuses: false` - Disables Alt key menu activation to prevent interference with i3wm mod key

## Installation

The `user.js` file should be copied to your Firefox profile directory:

**For regular Firefox:**
```bash
cp user.js ~/.mozilla/firefox/PROFILE_NAME/
```

**For Snap Firefox:**
```bash
cp user.js ~/snap/firefox/common/.mozilla/firefox/PROFILE_NAME/
```

Replace `PROFILE_NAME` with your actual Firefox profile directory name (usually something like `xxxxxxxx.default`).

## Usage

After copying the file, restart Firefox for the changes to take effect. The Alt key will no longer activate Firefox's menu bar, allowing it to work properly with window managers that use Alt as a modifier key.
