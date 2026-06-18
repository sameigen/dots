# Window Management — Cross-Machine Source of Truth

One muscle memory across all three machines on the Iris.

**WM modifier = the GUI/"super" thumb key:** **Cmd** (macOS) · **Super/Mod4** (Linux/i3) · **Win** (Windows/GlazeWM).
Same physical thumb key everywhere. **Copy/paste stays on Ctrl** (Linux + Windows) / **Cmd** (macOS) — i.e. Windows behaves like your Linux box, so no keyboard firmware swap is required for this.

| Action | macOS (Raycast) | Linux (i3, Mod4) | Windows (GlazeWM) |
|---|---|---|---|
| Focus left/down/up/right | Cmd+Shift+H/J/K/L¹ | Super+H/J/K/L | Win+H/J/K/L |
| Move window left/down/up/right | Cmd+Shift+H/J/K/L | Super+Shift+H/J/K/L | Win+Shift+H/J/K/L |
| Almost-maximize | Cmd+Shift+M | Super+Shift+M | Win+Shift+M (float-centered) |
| Full maximize / fullscreen | Cmd+Shift+N | Super+F | Win+Shift+N |
| Terminal | Cmd+Enter | Super+Enter | Win+Enter |
| Launcher | Cmd+Space (Raycast) | Super+D (rofi) | Win+Space (PowerToys Command Palette) |
| Workspace 1–6 | — | Super+1..6 | Win+1..6 |
| Send window to workspace 1–6 | — | Super+Shift+1..6 | Win+Shift+1..6 |
| Toggle floating | — | Super+Shift+Space | Win+Shift+Space |
| Close window | Cmd+W | Super+Shift+Q | Win+Shift+Q |
| Toggle split direction | — | Super+V | Win+V |
| Resize | — | Super+R (mode) | Win+U/I/O/P |
| Reload WM config | — | Super+Shift+C | Win+Shift+R |
| Pause WM (for ranked games) | — | — | Win+Shift+P |
| Always-on-top | — | — | Win+Ctrl+T (PowerToys) |

¹ Raycast does half-tiling; i3/GlazeWM auto-tile, so there it's *focus* (no shift) vs *move* (shift). Stacked monitors: Win+K / Win+J cross between your upper & lower screens; Win+Shift+K/J throw a window across them.

## Windows gotchas
- **Win+Space** is the OS language switcher. To use it for the launcher: set PowerToys Command Palette's hotkey to Win+Space **and** disable the language hotkey (Settings → Time & Language → Typing → Advanced keyboard settings → Input language hot keys → set to *Not Assigned*). Or use Win+Alt+Space.
- Avoid **Win+Shift+S** (Snipping Tool) and keep **Win+L** (lock).
- **Win+Enter** is free (Narrator moved to Win+Ctrl+Enter).

## Deploy
- **Windows:** copy `config/glazewm/config.yaml` → `%USERPROFILE%\.glzr\glazewm\config.yaml`, then launch GlazeWM (installing it does NOT auto-start it — add to startup from the tray icon once you like it).
- **Linux:** merge `config/i3/keybinds.conf` into `~/.config/i3/config` (set `set $mod Mod4`).
- **macOS:** Raycast → Extensions → Window Management; mirror the table above (Raycast's window commands + custom hotkeys).
