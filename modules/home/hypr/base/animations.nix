{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;

      bezier = [
        # Main motion curve – smooth, slightly weighted
        "easeOut, 0.22, 1, 0.36, 1"

        # Fast entry, gentle settle
        "easeInOut, 0.4, 0, 0.2, 1"

        # Subtle overshoot without wobble
        "softOvershoot, 0.25, 1.05, 0.4, 1"

        # Linear fallback
        "linear, 1, 1, 1, 1"
      ];

      animation = [
        # Windows
        "windows, 1, 4, easeOut, slide"
        "windowsIn, 1, 4, easeOut, slide"
        "windowsOut, 1, 3, easeInOut, slide"
        "windowsMove, 1, 4, easeOut, slide"

        # Borders
        "border, 1, 2, linear"
        # "borderangle, 1, 120, linear, loop"
        "borderangle, 0"

        # Fade
        "fade, 1, 3, easeInOut"

        # Workspaces
        "workspaces, 1, 4, softOvershoot, slidefade 20%"
        "workspacesIn, 1, 4, easeOut, slidefade 20%"
        "workspacesOut, 1, 3, easeInOut, slidefade 20%"
      ];
    };
  };
}
