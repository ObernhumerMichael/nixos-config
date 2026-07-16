{ config, pkgs, ... }:

{
  imports = [
    ./base/keybindings.nix
    ./base/nightlight.nix
    ./base/privacy.nix
    ./base/interface.nix
    ./base/shell.nix

    ./extensions/appindicator.nix
    ./extensions/blur-my-shell.nix
    ./extensions/brightness-control-using-ddcutil.nix
    ./extensions/caffeine.nix
  ];

  # --------------------------------
  # Extensions only (see shell.nix for the actual shell config)
  # --------------------------------
  dconf.settings = {
    "org/gnome/shell" = {
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
