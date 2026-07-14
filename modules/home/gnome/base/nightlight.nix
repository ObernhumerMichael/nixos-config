{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-from = 19.0;
      night-light-schedule-to = 6;
      night-night-light-temperature = "uint32 3100";
    };
  };
}
