{ lib, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" =
      # Super + 1-9 -> switch to workspace N, Super + Shift + 1-9 -> move window there.
      # Unset the default switch-to-application-N bindings that clash with Super + 1-9.
      lib.mergeAttrsList (
        map (
          n:
          let
            i = toString n;
          in
          {
            "switch-to-workspace-${i}" = [ "<Super>${i}" ];
            "move-to-workspace-${i}" = [ "<Super><Shift>${i}" ];
            "switch-to-application-${i}" = [ ];
          }
        ) (lib.range 1 9)
      )
      // {
        # Super + Shift + H/J/K/L -> move focused window to adjacent monitor
        move-to-monitor-left = [ "<Super><Shift>h" ];
        move-to-monitor-down = [ "<Super><Shift>j" ];
        move-to-monitor-up = [ "<Super><Shift>k" ];
        move-to-monitor-right = [ "<Super><Shift>l" ];

        minimize = [ ];
      };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      calculator = [ "Calculator" ];
      screensaver = [ "<Alt><Super>l" ];
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>b";
      command = "brave";
      name = "Start Brave Browser";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>Return";
      command = "kitty";
      name = "Start Terminal";
    };
  };
}
