{ config, pkgs, ... }:

{
  services.hypridle = {
    enable = true;

    # Bind to Hyprland session target (recommended)
    systemdTarget = "hyprland-session.target";

    settings = {
      general = {
        # Avoid spawning multiple hyprlock instances
        lock_cmd = "pidof hyprlock || hyprlock";

        # Lock before suspend
        before_sleep_cmd = "loginctl lock-session";

        # Ensure display wakes properly after suspend
        after_sleep_cmd = "hyprctl dispatch dpms on";

        # Respect inhibitors by default (Firefox, media players, etc.)
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
        ignore_wayland_inhibit = false;

        # Auto-detect lock-before-sleep behavior
        inhibit_sleep = 2;
      };

      listener = [
        # --- Dim screen backlight ---
        {
          timeout = 150; # 2.5 min
          on-timeout = "brightnessctl -s set 10 && ddcutil setvcp 10 10";
          on-resume = "brightnessctl -r && ddcutil setvcp 10 50";
        }

        # --- Keyboard backlight off (optional) ---
        {
          timeout = 150; # 2.5 min
          on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
          on-resume = "brightnessctl -rd rgb:kbd_backlight";
        }

        # --- Lock screen ---
        {
          timeout = 300; # 5 min
          on-timeout = "loginctl lock-session";
        }

        # --- Turn displays off ---
        {
          timeout = 330; # 5.5 min
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on && brightnessctl -r && ddcutil setvcp 10 50";
        }

        # --- Suspend system ---
        {
          timeout = 1800; # 30 min
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
