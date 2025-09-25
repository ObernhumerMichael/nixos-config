{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us,at";
      kb_options = "grp:alt_shift_toggle";

      follow_mouse = 1;
      numlock_by_default = true;

      sensitivity = -0.1;

      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        clickfinger_behavior = false;
        middle_button_emulation = true;
        tap-to-click = true;
        drag_lock = false;
      };
    };

    gesture = [
      "3, horizontal, workspace"
    ];

    gestures = {
      workspace_swipe_distance = 500;
      workspace_swipe_invert = true;
      workspace_swipe_min_speed_to_force = 30;
      workspace_swipe_cancel_ratio = 0.5;
      workspace_swipe_create_new = true;
      workspace_swipe_forever = true;
    };

    binds = {
      workspace_back_and_forth = true;
      allow_workspace_cycles = true;
      pass_mouse_when_bound = false;
    };

    cursor = {
      no_hardware_cursors = 1;
    };
  };
}
