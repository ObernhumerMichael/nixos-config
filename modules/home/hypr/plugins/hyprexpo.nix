{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    plugin = {
      hyprexpo = {
        columns = 3;
        gap_size = 5;
        bg_col = "rgb(111111)";
        workspace_method = "first 1";
        enable_gesture = true;
        gesture_fingers = 3;
        gesture_distance = 150;
        gesture_positive = false;
      };
    };
  };
}
