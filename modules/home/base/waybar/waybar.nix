{ config, pkgs, ... }:

let
  c = config.lib.stylix.colors;
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        mode = "dock";
        margin = "0 20 0 20";
        height = 30;
        output = [
          "HDMI-A-3"
          "eDP-1"
        ];

        modules-left = [
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "tray"
          "bluetooth"
          "backlight"
          "pulseaudio"
          "battery"
          "clock"
        ];

        "clock" = {
          format = "{:%H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              today = "<span color='${c.withHashtag.base0D}'><b><u>{}</u></b></span>";
            };
          };
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 10;
          };
          format = "{icon} {capacity}%";
          format-time = "{H} hr {M} min";
          format-icons = [
            "󰂎"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          format-charging = "󰉁 {capacity}%";
          min-length = 7;
          max-length = 7;
          tooltip-format = "Discharging: {time}";
          tooltip-format-charging = "Charging: {time}";
          events = {
            on-discharging-warning = "notify-send 'Low Battery' '{capacity}% battery remaining'";
            on-discharging-critical = "notify-send 'Low Battery' '{capacity}% battery remaining' -u critical";
            on-charging-100 = "notify-send 'Battery full' 'Battery is at {capacity}%'";
          };
        };

        "pulseaudio" = {
          states = {
            silent = 0;
          };
          format = "{icon} {volume}%";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "󰝟";
          format-silent = "󰸈";
          format-icons = {
            "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
            "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "󰝟";
            headphone = "󰋋";
            hands-free = "";
            headset = "󰋎";
            phone = "󰏲";
            phone-muted = "󰷯";
            portable = "󰏲";
            portable-muted = "󰷯";
            car = "";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          scroll-step = 1;
          on-click = "pavucontrol";
          ignored-sinks = [ "Easy Effects Sink" ];
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          min-length = 7;
          max-length = 7;
          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";
        };

        "bluetooth" = {
          format = "";
          format-disabled = "󰂲";
          format-off = "󰂲";
          format-on = "󰂯";
          format-connected = "{num_connections}󰂯";
          format-no-controller = "󰂳";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_battery_percentage}%";
        };
      };

      "tray" = {
        reverse-direction = true;
      };
    };

    style = ''
      * {
        font-family: ${config.stylix.fonts.emoji.name};
        font-size: 16px;
        padding: 0px;
        margin: 0px;
      }

      window#waybar {
        background-color: ${c.withHashtag.base00};
        color: ${c.withHashtag.base05};
        /*border: 2px solid ${c.withHashtag.base0D};*/
        border-radius: 10px;
      }

      .modules-right {
        margin-right: 7px;
      }

      #workspaces,
      #clock,
      #battery,
      #pulseaudio,
      #backlight,
      #bluetooth {
        margin-left: 5px;
      }

      #workspaces button {
        padding-left: 5px;
        padding-right: 5px;
        background-color: ${c.withHashtag.base00};
      }
      #workspaces button:hover {
        background-color: ${c.withHashtag.base02};
      }
      #workspaces button.active{
        background-color: ${c.withHashtag.base0D};
        color: ${c.withHashtag.base00};
      }


      #clock {
        color: ${c.withHashtag.base0D};
        font-weight: bold;
      }

      #battery {
        font-size: 18px;
        color: ${c.withHashtag.base0B};
      }
      #battery.warning {
        color: ${c.withHashtag.base0A};
      }
      #battery.critical {
        color: ${c.withHashtag.base08};
      }

      #pulseaudio {
        color: ${c.withHashtag.base0D};
        background-color: ${c.withHashtag.base00};
      }
      #pulseaudio.silent,
      #pulseaudio.muted {
        color: ${c.withHashtag.base08};
        background-color: ${c.withHashtag.base00};
      }

      #backlight {
        color: ${c.withHashtag.base0A};
      }
      #backlight.icon {
        font-size: 30px; /* adjust as needed */
      }

      #bluetooth{
        color: ${c.withHashtag.base0D};
      }
      #bluetooth.disabled,
      #bluetooth.no-controller,
      #bluetooth.off {
        color: ${c.withHashtag.base0D};
      }
      #bluetooth.discoverable,
      #bluetooth.pairable,
      #bluetooth.discovering {
        color: ${c.withHashtag.base0C};
      }
    '';
  };
}
