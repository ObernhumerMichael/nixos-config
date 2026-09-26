{ lib, ... }:

{
  imports = [
    ./keybindings.nix
    ./extensions/appindicator.nix
    ./extensions/blur-my-shell.nix
    ./extensions/brightness-control-using-ddcutil.nix
    ./extensions/caffeine.nix
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/privacy" = {
      remove-old-trash-files = true;
      remove-old-temp-files = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-from = 19.0;
      night-light-schedule-automatic = false; # use the manual from/to schedule below
      night-light-schedule-to = 6.0;
      night-light-temperature = lib.hm.gvariant.mkUint32 3100;
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      always-show-log-out = true;
      favorite-apps = [
        "brave-browser.desktop"
        "code.desktop"
      ];
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
