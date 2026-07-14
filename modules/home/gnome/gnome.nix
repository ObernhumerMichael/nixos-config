{ config, pkgs, ... }:

{
  imports = [
    ./base/keybindings.nix
    ./base/nightlight.nix

    ./extensions/appindicator.nix
    ./extensions/blur-my-shell.nix
    ./extensions/brightness-control-using-ddcutil.nix
    ./extensions/caffeine.nix
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell" = {
      always-show-log-out = true;
    };

    # --------------------------------
    # Extensions
    # --------------------------------
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "caffeine@patapon.info"
        "appindicatorsupport@rgcjonas.gmail.com"
        "display-brightness-ddcutil@themightydeity.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
      ];
    };
  };
}
