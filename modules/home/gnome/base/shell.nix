{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      always-show-log-out = true;
      favorite-apps = [
        "brave-browser.desktop"
        "code.desktop"
      ];
    };
  };
}
