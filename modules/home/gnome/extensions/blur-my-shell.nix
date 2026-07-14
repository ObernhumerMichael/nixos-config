{ config, pkgs, ... }:

let
  toggleBlurMyShell = pkgs.writeShellScript "toggle-blur-my-shell" ''
    sleep 5
    ${pkgs.gnome-shell}/bin/gnome-extensions disable blur-my-shell@aunetx
    sleep 1
    ${pkgs.gnome-shell}/bin/gnome-extensions enable blur-my-shell@aunetx
  '';
in
{
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
  ];

  dconf.settings = {
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      static-blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      style-components = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      static-blur = false;
    };
  };

  systemd.user.services.blur-my-shell-fix = {
    Unit = {
      Description = "Restart Blur My Shell to fix top panel blur glitch on login";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${toggleBlurMyShell}";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
