{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      ",preferred,auto,1"
      "eDP-1,preferred,auto-left,1"
      "HDMI-A-1,highrr,auto-right,1"
      # "preffered,auto-right,1,mirror,eDP-1" # Mirror the inbuilt monitor
    ];
  };
}
