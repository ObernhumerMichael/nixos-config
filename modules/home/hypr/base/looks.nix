{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;

      # Set to true enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = true;

      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;

      layout = "dwindle";
    };

    # https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
      rounding = 10;

      # Change transparency of focused and unfocused windows
      active_opacity = 1.0;
      inactive_opacity = 0.9;
      fullscreen_opacity = 1.0;

      dim_inactive = true;
      dim_strength = 0.1;
      dim_special = 0.8;

      shadow = {
        enabled = false;
        range = 6;
        render_power = 1;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#blur
      blur = {
        enabled = true;
        size = 6;
        passes = 2;
        ignore_opacity = true;
        new_optimizations = true;
        special = true;
        vibrancy = 0.1696;
      };

    };

    layerrule = [
      "blur, wallpaper-selector"
      "blur, logout_dialog"
    ];
  };
}
