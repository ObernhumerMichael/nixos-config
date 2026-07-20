{ config, pkgs, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
  ];

  dconf.settings = {
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      static-blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      style-components = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      static-blur = false;
    };
  };
}
