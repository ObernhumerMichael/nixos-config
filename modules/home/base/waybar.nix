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
          "pulseaudio/slider"
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

        "pulseaudio/slider" = {
          min = 0;
          max = 100;
          orientation = "vertical";
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
        font-size: 16px;
      }

      #battery {
        color: ${c.withHashtag.base0B};
      }
      #battery.warning {
        color: ${c.withHashtag.base0A};
      }
      #battery.critical {
        color: ${c.withHashtag.base08};
      }

      #pulseaudio-slider {
        padding: 0;
        margin: 0;
      }
      #pulseaudio-slider slider {
        min-height: 0px;
        min-width: 0px;
        opacity: 0;
        background-image: none;
        border: none;
        box-shadow: none;
      }
      #pulseaudio-slider trough {
        min-height: 80px;
        min-width: 10px;
        border-radius: 5px;
        background-color: ${c.withHashtag.base01};
      }
      #pulseaudio-slider highlight {
        min-width: 10px;
        border-radius: 5px;
        background-color: ${c.withHashtag.base0D};
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
    '';
  };
}
