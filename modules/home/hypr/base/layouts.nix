{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    dwindle = {
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
