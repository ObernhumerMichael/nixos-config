{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    misc = {
      force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background.
      mouse_move_enables_dpms = true; # If DPMS is set to off, wake up the monitors if the mouse moves.
      enable_swallow = true;
      swallow_regex = "^(kitty)$";
    };
  };
}
