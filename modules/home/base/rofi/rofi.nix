{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
  xdg.configFile."rofi/launcher.rasi".source = ./launcher.rasi;
}
