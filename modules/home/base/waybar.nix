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
        position = "left";
        margin = "20 0 20 0";
        width = 30;
        output = [
          "HDMI-A-3"
          "eDP-1"
        ];

        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
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
          format = "{:%H\n%M}";
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
          rotate = 270;
          states = {
            warning = 30;
            critical = 10;
          };
          format = "{icon}";
          format-charging = "󰂄";
          format-full = "󰁹";
          format-icons = [
            "󰁺"
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
          tooltip-format = "{timeTo} {capacity} %";
        };

        "pulseaudio" = {
          states = {
            silent = 0;
          };
          format = "{icon}";
          format-bluetooth = "{icon}";
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
          device = "intel_backlight";
          format = "{icon}";
          tooltip-format = "{percent}% {icon}";
          format-icons = [
            "󰃚"
            "󰃞"
            "󰃟"
            "󰃠"
          ];
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
    };

    style = ''
      * {
        font-family: ${config.stylix.fonts.emoji.name};
        font-size: 14px;
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
        margin-bottom: 5px;
      }

      #workspaces button {
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
        font-size: 18px;
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
        font-size: 18px;
        color: ${c.withHashtag.base0D};
        background-color: ${c.withHashtag.base00};
      }
      #pulseaudio.silent,
      #pulseaudio.muted {
        color: ${c.withHashtag.base08};
        background-color: ${c.withHashtag.base00};
      }

      #backlight {
        font-size: 19px;
        color: ${c.withHashtag.base0A};
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
