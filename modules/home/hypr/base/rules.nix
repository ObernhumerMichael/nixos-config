{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {

    windowrule = [

      # ============================================================
      # Picture-in-Picture (robust, tag-based)
      # ============================================================

      # Tag PiP windows (dynamic tag)
      "match:title ^(Picture-in-Picture)$, tag +pip"

      # PiP behavior
      "match:tag pip*, float on"
      "match:tag pip*, pin on"
      "match:tag pip*, keep_aspect_ratio on"
      "match:tag pip*, size (monitor_w*0.25) (monitor_h*0.25)"
      "match:tag pip*, move (monitor_w*0.72) (monitor_h*0.07)"

      # ============================================================
      # Centered dialogs & tools
      # ============================================================

      # Generic dialogs
      "match:modal true, center on"
      "match:title ^(Save File)$, center on"

      # Tools that behave badly tiled
      "match:class ^(GeoGebra)$, float on"
      "match:class ^(GeoGebra)$, center on"

      # ============================================================
      # VS Code (title-safe)
      # ============================================================

      "match:class ^(Code)$, no_initial_focus on"
      "match:class ^(Code)$, tag +code"

      # ============================================================
      # ProtonVPN
      # ============================================================

      "match:class ^(protonvpn-app)$, float on"
      "match:class ^(protonvpn-app)$, size (monitor_w*0.25) (monitor_h*0.5)"
      "match:class ^(protonvpn-app)$, center on"
      "match:class ^(protonvpn-app)$, tag +utility"

      # ============================================================
      # Gwenview image info
      # ============================================================

      "match:title ^(Image Information — Gwenview)$, float on"
      "match:title ^(Image Information — Gwenview)$, size (monitor_w*0.5) (monitor_h*0.5)"
      "match:title ^(Image Information — Gwenview)$, center on"

      # ============================================================
      # Idle inhibit (correct & minimal)
      # ============================================================

      # Only inhibit when actually fullscreen
      "match:fullscreen true, idle_inhibit fullscreen"

      # ============================================================
      # Suppress annoying app behavior
      # ============================================================

      # Ignore maximize requests globally
      "match:class .*, suppress_event maximize"

      # ============================================================
      # XWayland focus & drag fixes
      # ============================================================

      "match:xwayland true, match:float true, no_focus on"
      "match:xwayland true, match:float true, no_follow_mouse on"
    ];

    # ============================================================
    # Workspace → monitor mapping
    # ============================================================

    workspace = [
      "1, monitor:eDP-1"
      "2, monitor:desc:ASUSTek COMPUTER INC VG27AQ1A LBLMQS008039, default:true"
    ];
  };
}
