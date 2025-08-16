{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$editor" = "nvim";

    bind = [
      # General Keybindings
      "CTRL ALT, Delete, exec, hyprctl dispatch exit 0"
      "$mod, Q, killactive"
      "$mod, Return, exec, $terminal"
      "$mod, F, fullscreen"
      "$mod SHIFT, F, togglefloating"
      "$mod, P, pseudo" # dwindle

      # Applications
      "$mod, A, hyprexpo:expo, toggle" # workspace overview
      "$mod, R, exec, rofi -show drun -theme ~/.config/rofi/launcher.rasi" # application launcher

      # Move focus
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"

      # Move windows
      "$mod CTRL, h, movewindow, l"
      "$mod CTRL, l, movewindow, r"
      "$mod CTRL, k, movewindow, u"
      "$mod CTRL, j, movewindow, d"

      # Resize windows
      "$mod SHIFT, h, resizeactive,-50 0"
      "$mod SHIFT, l, resizeactive,50 0"
      "$mod SHIFT, k, resizeactive,0 -50"
      "$mod SHIFT, j, resizeactive,0 50"

      # Cycle windows if floating bring to top
      "ALT, tab, cyclenext"
      "ALT, tab, bringactivetotop"

      # Cycle workspaces
      "$mod, tab, workspace, m+1"
      "$mod SHIFT, tab, workspace, m-1"

      # Scroll through existing workspaces with mainMod + scroll
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"

      # Special workspace (scratchpad)
      "$mod, D, togglespecialworkspace, magic"
      "$mod SHIFT, D, movetoworkspace, special:magic"

      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mod, mouse:272, movewindow"
      # "$mod, mouse:273, resizewindow"
    ]
    ++ (
      # workspaces
      # binds $mod + {1..9} to workspace {1..9}
      # binds $mod SHIFT + move window to workspace {1..9}
      # binds $mod CTRL + move window to workspace {1..9} silently
      # use [ or ] for +1/-1 logic
      builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            "$mod CTRL, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
          ]
        ) 9
      )
    )
    ++ ([
      "$mod, bracketleft, workspace, -1"
      "$mod, bracketright, workspace, +1"
      "$mod SHIFT, bracketleft, movetoworkspace, -1"
      "$mod SHIFT, bracketright, movetoworkspace, +1"
      "$mod CTRL, bracketleft, movetoworkspacesilent, -1"
      "$mod CTRL, bracketright, movetoworkspacesilent, +1"
    ]);

    bindel = [
      # Laptop multimedia keys for volume and LCD brightness
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+ && ddcutil setvcp 10 + 10 &"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%- && ddcutil setvcp 10 - 10 &"

      # Requires playerctl
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
