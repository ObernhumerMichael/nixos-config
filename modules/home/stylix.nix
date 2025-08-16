{ config, pgks, ... }:

{
  stylix.targets.firefox = {
    enable = true;
    profileNames = [ "default" ];
    colorTheme.enable = true;
  };
}
