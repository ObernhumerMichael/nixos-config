{ config, pkgs, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
    caffeine
  ];

  dconf.settings = {
    # Caffeine defaults (toggle in top bar, no auto-timer)
    "org/gnome/shell/extensions/caffeine" = {
      toggle-state = false;
    };
  };
}
