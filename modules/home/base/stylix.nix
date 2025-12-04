{ config, pkgs, ... }:

{
  stylix.targets = {
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
