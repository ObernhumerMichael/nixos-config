{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    # LAYOUTS

    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle = {
      pseudotile = true; # Master switch for pseudotiling.
      preserve_split = true; # You probably want this
      special_scale_factor = 0.8;
    };

    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master = {
      new_status = "master";
      new_on_top = 1;
      mfact = 0.5;
    };
  };
}
