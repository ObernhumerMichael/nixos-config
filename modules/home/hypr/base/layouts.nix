{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    dwindle = {
      pseudotile = true; # Master switch for pseudotiling.
      preserve_split = true; # You probably want this
      special_scale_factor = 0.9;
    };

    master = {
      new_status = "master";
      new_on_top = 1;
      mfact = 0.5;
    };
  };
}
