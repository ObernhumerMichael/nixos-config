{ config, pgks, ... }:

{
  stylix.targets = {
    firefox = {
      enable = true;
      profileNames = [ "default" ];
      colorTheme.enable = true;
    };
    waybar = {
      enable = false;
      # enableCenterBackColors = true;
      # enableLeftBackColors = true;
      # enableRightBackColors = true;
    };
  };
}
