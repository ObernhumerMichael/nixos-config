{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        height = 25;
        output = [
          "HDMI-A-3"
          "eDP-1"
        ];
        modules-left = [
          # "hyprland/window"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "clock"
        ];
        "clock" = {
          interval = 60;
          format = "{:%H\n%M}";
          tooltip-format = "{:%Y-%m-%d}";
          timezone = "Europe/Vienna";
        };
      };
    };

    # style = ''
    #   * {
    #     border: none;
    #     border-radius: 0;
    #     font-family: Source Code Pro;
    #   }
    #   window#waybar {
    #     background: #16191C;
    #     color: #AAB2BF;
    #   }
    #   #workspaces button {
    #     padding: 0 5px;
    #   }
    # '';
  };
}
