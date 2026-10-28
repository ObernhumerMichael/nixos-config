{ pkgs, ... }:

{
  home.packages = [ pkgs.ddcutil ];

  dconf.settings = {
    "org/gnome/shell/extensions/display-brightness-ddcutil" = {
      button-location = 1; # to use the system menue
      hide-system-indicator = true;
    };
  };
}
