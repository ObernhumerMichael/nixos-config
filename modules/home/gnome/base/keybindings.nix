{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      # Super + 1-9 -> switch to workspace N
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-5 = [ "<Super>5" ];
      switch-to-workspace-6 = [ "<Super>6" ];
      switch-to-workspace-7 = [ "<Super>7" ];
      switch-to-workspace-8 = [ "<Super>8" ];
      switch-to-workspace-9 = [ "<Super>9" ];

      # Super + Shift + 1-9 -> move focused window to workspace N
      move-to-workspace-1 = [ "<Super><Shift>1" ];
      move-to-workspace-2 = [ "<Super><Shift>2" ];
      move-to-workspace-3 = [ "<Super><Shift>3" ];
      move-to-workspace-4 = [ "<Super><Shift>4" ];
      move-to-workspace-5 = [ "<Super><Shift>5" ];
      move-to-workspace-6 = [ "<Super><Shift>6" ];
      move-to-workspace-7 = [ "<Super><Shift>7" ];
      move-to-workspace-8 = [ "<Super><Shift>8" ];
      move-to-workspace-9 = [ "<Super><Shift>9" ];

      # Super + Shift + H/J/K/L -> move focused window to adjacent monitor
      move-to-monitor-left = [ "<Super><Shift>h" ];
      move-to-monitor-down = [ "<Super><Shift>j" ];
      move-to-monitor-up = [ "<Super><Shift>k" ];
      move-to-monitor-right = [ "<Super><Shift>l" ];

      # Unset default keybindings to allow Super + 1-9 combination
      switch-to-application-1 = [ ];
      switch-to-application-2 = [ ];
      switch-to-application-3 = [ ];
      switch-to-application-4 = [ ];
      switch-to-application-5 = [ ];
      switch-to-application-6 = [ ];
      switch-to-application-7 = [ ];
      switch-to-application-8 = [ ];
      switch-to-application-9 = [ ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      screensaver = [ "<Alt><Super>l" ];
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
