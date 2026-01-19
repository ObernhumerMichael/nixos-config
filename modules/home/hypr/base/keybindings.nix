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
      # pyprland plugins
      # ───────────────
      # Toggle terminal scratchpad
      "$mod SHIFT, Return, exec, pypr toggle term"
      # Toggle magnifier on the focused window
      "$mod, Z, exec, pypr zoom"

      # ───────────────
      # Clear notifications & lock screen
      # ───────────────
      "$mod, N, global, caelestia:clearNotifs"
      "$mod SHIFT, Escape, global, caelestia:session"

      # ───────────────
      # Launchers & apps
      # ───────────────
      "$mod, R, global, caelestia:launcher"
      "$mod ALT, L, global, caelestia:lock"
      "$mod, B, exec, brave"
      "$mod, E, exec, nautilus"

      # ───────────────
      # Wallpaper
      # ───────────────
      "$mod, W, exec, caelestia wallpaper"

      # ───────────────
      # Screenshots
      # ───────────────
      "$mod, S, global, caelestia:screenshot" # region

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
      ", XF86Search, global, caelestia:launcher"
      ", Print, exec, caelestia screenshot" # fullscreen → clipboard

      ", XF86Screenshot, exec, grimblast copysave screen ~/Pictures/Screenshots/screenshot_$(date \"+%Y-%m-%d-%H-%M-%S\").png"
      "SHIFT, XF86Screenshot, exec, grimblast copysave area ~/Pictures/Screenshots/screenshot_$(date \"+%Y-%m-%d-%H-%M-%S\").png"

      ", XF86WWW, exec, brave"
      ", XF86Mail, exec, thunderbird"
      ", XF86ScreenSaver, global, caelestia:lock"
      ", XF86Sleep, exec, systemctl suspend"
      ", XF86Favorites, global, caelestia:launcher"
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
      ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
      ", XF86MonBrightnessDown, global, caelestia:brightnessDown"

      ", XF86AudioPlay, global, caelestia:mediaToggle"
      ", XF86AudioPause, global, caelestia:mediaToggle"
      ", XF86AudioNext, global, caelestia:mediaNext"
      ", XF86AudioPrev, global, caelestia:mediaPrev"
    ];
  };
}
