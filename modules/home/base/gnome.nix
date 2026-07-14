{ config, pkgs, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    caffeine
    appindicator
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
        "blur-my-shell@aunetx"
      ];
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
    };

    # Caffeine defaults (toggle in top bar, no auto-timer)
    "org/gnome/shell/extensions/caffeine" = {
      toggle-state = false;
    };
  };
}
