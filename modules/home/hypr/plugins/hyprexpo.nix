{ config, pkgs, ... }:
{

  wayland.windowManager.hyprland = {
    plugins = [
      pkgs.hyprlandPlugins.hyprexpo
    ];

    settings = {
      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 3;
          bg_col = "rgb(${config.lib.stylix.colors.base03})";
          workspace_method = "first 1";
          enable_gesture = true;
          gesture_fingers = 3;
          gesture_distance = 150;
          gesture_positive = false;
        };
      };
    };
  };
}
