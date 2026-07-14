{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/privacy" = {
      remove-old-trash-files = true;
      remove-old-temp-files = true;
    };
  };
}
