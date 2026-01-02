{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$editor" = "nvim";

    bind = [
      # ───────────────
      # System
      # ───────────────
      "CTRL ALT, Delete, exec, hyprctl dispatch exit 0"

      "$mod, Q, killactive"
      "$mod, Return, exec, $terminal"
      "$mod, F, fullscreen"
      "$mod SHIFT, F, togglefloating"
      "$mod, P, pseudo"

      # ───────────────
      # Launchers & apps
      # ───────────────
      "$mod, R, exec, rofi -show drun -theme ~/.config/rofi/launcher.rasi"
      "$mod ALT, L, exec, hyprlock"
      "$mod, B, exec, brave"
      "$mod, E, exec, nautilus"

      # ───────────────
      # Screenshots
      # ───────────────
      "$mod, S, exec, grimblast copysave area ~/Pictures/Screenshots/screenshot_$(date \"+%Y-%m-%d-%H-%M-%S\").png"
      "$mod SHIFT, S, exec, grimblast copysave active ~/Pictures/Screenshots/screenshot_$(date \"+%Y-%m-%d-%H-%M-%S\").png"
      "$mod ALT, S, exec, grimblast copysave output ~/Pictures/Screenshots/screenshot_$(date \"+%Y-%m-%d-%H-%M-%S\").png"

      # ───────────────
      # Focus movement (vim-style)
      # ───────────────
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"

      # ───────────────
      # Move windows
      # ───────────────
      "$mod CTRL, h, movewindow, l"
      "$mod CTRL, l, movewindow, r"
      "$mod CTRL, k, movewindow, u"
      "$mod CTRL, j, movewindow, d"

      # ───────────────
      # Window cycling
      # ───────────────
      "ALT, Tab, cyclenext"
      "ALT, Tab, bringactivetotop"

      # ───────────────
      # Workspace navigation
      # ───────────────
      "$mod, Tab, workspace, m+1"
      "$mod SHIFT, Tab, workspace, m-1"

      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"

      # ───────────────
      # Scratchpad
      # ───────────────
      "$mod, D, togglespecialworkspace, magic"
      "$mod SHIFT, D, movetoworkspace, special:magic"

      # ───────────────
      # Hardware / misc keys
      # ───────────────
      ", XF86Calculator, exec, qalculate-qt"
      ", XF86Explorer, exec, thunar"
      ", XF86Search, exec, rofi -show drun -theme ~/.config/rofi/launcher.rasi"
      ", Print, exec, grimblast copysave area ~/Pictures/Screenshots/screenshot_$(date \"+%Y-%m-%d-%H-%M-%S\").png"

      ", XF86Screenshot, exec, grimblast copysave screen ~/Pictures/Screenshots/screenshot_$(date \"+%Y-%m-%d-%H-%M-%S\").png"
      "SHIFT, XF86Screenshot, exec, grimblast copysave area ~/Pictures/Screenshots/screenshot_$(date \"+%Y-%m-%d-%H-%M-%S\").png"

      ", XF86WWW, exec, brave"
      ", XF86Mail, exec, thunderbird"
      ", XF86ScreenSaver, exec, hyprlock"
      ", XF86Sleep, exec, systemctl suspend"
      ", XF86Favorites, exec, rofi -show drun -theme ~/.config/rofi/launcher.rasi"
      ", XF86Launch1, exec, kitty"
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

    binde = [
      # ───────────────
      # Resize windows
      # ───────────────
      "$mod SHIFT, h, resizeactive, -50 0"
      "$mod SHIFT, l, resizeactive,  50 0"
      "$mod SHIFT, k, resizeactive,  0 -50"
      "$mod SHIFT, j, resizeactive,  0  50"
    ];

    binds = {
      drag_threshold = 10;
    };

    bindm = [
      # Drag floating window
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bindc = [
      # Click = toggle floating
      "$mod, mouse:272, togglefloating"
    ];

    # Multimedia keys that also work within the lock screen
    bindel = [
      # volume
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      # LCD brightness
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+ && ddcutil setvcp 10 + 10 &"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%- && ddcutil setvcp 10 - 10 &"

      # Requires playerctl for player control
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
