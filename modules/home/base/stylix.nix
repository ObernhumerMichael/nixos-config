{ config, pkgs, ... }:

{
  stylix.targets = {
    anki.enable = false;
    firefox = {
      enable = true;
      profileNames = [ "default" ];
      colorTheme.enable = true;
    };
    waybar = {
      enable = false;
    };
  };
}
