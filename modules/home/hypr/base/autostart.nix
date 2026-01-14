{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "systemctl --user start hyprpolkitagent"
      "caelestia wallpaper -f ~/Downloads/Wallpapers/catppuccin.png"
      "pypr"
    ];
  };
}
