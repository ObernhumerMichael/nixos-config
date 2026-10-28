{ lib, pkgs, ... }:

{
  imports = [
    ./keybindings.nix
    ./extensions/blur-my-shell.nix
    ./extensions/brightness-control-using-ddcutil.nix
  ];

  # installs each extension and enables it by its UUID
  programs.gnome-shell = {
    enable = true;
    extensions = with pkgs.gnomeExtensions; [
      { package = caffeine; }
      { package = appindicator; }
      { package = brightness-control-using-ddcutil; }
      { package = user-themes; }
      { package = blur-my-shell; }
    ];
  };

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
      always-show-log-out = true;
      favorite-apps = [
        "brave-browser.desktop"
        "code.desktop"
      ];
    };
  };
}
