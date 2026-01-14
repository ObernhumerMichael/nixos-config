{
  config,
  pkgs,
  inputs,
  ...
}:

let
  fonts = config.stylix.fonts;
in
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = true;
    cli.enable = true;

    systemd = {
      enable = true;
      target = "graphical-session.target";
    };

    settings = {
      general = {
        apps = {
          terminal = [ "kitty" ];
          explorer = [ "thunar" ];
          audio = [ "pavucontrol" ];
          playback = [ "mpv" ];
        };

        idle = {
          lockBeforeSleep = true;
          inhibitWhenAudio = true;
          timeouts = [
            {
              timeout = 180;
              idleAction = "lock";
            }
            {
              timeout = 300;
              idleAction = "dpms off";
              returnAction = "dpms on";
            }
            {
              timeout = 600;
              idleAction = [
                "systemctl"
                "suspend-then-hibernate"
              ];
            }
          ];
        };
      };

      background = {
        enabled = true;
        desktopClock.enable = false;

        theme = {
          enableGtk = false;
          enableQt = false;
        };
      };

      bar = {
        persistent = true;
        showOnHover = true;

        entries = [
          {
            id = "logo";
            enabled = false;
          }
          {
            id = "workspaces";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "activeWindow";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "tray";
            enabled = true;
          }
          {
            id = "clock";
            enabled = true;
          }
          {
            id = "statusIcons";
            enabled = true;
          }
          {
            id = "power";
            enabled = true;
          }
        ];

        status = {
          showBattery = true;
          showNetwork = true;
          showBluetooth = true;
          showAudio = false;
          showKbLayout = true;
          showMicrophone = false;
          showLockStatus = false;
        };

        tray = {
          recolour = true;
          background = true;
        };

        workspaces = {
          shown = 5;
          perMonitorWorkspaces = true;
          showWindows = true;
          activeIndicator = true;
        };
      };

      launcher = {
        enableDangerousActions = false;
        maxShown = 7;
        showOnHover = false;
      };

      services = {
        audioIncrement = 0.1;
        brightnessIncrement = 0.1;
        maxVolume = 1.0;
        smartScheme = true;
        visualiserBars = 45;
      };

      paths = {
        wallpaperDir = "~/Pictures/Wallpapers";
      };
    };
  };
}
