{ config, pkgs, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
    brightness-control-using-ddcutil
  ];

  dconf.settings = {
    "org/gnome/shell/extensions/display-brightness-ddcutil" = {
      button-location = 1; # to use the system menue
    };
  };
}
