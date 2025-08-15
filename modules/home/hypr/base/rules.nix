{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "move 72% 7%,title:^(Picture-in-Picture)$ "
      "center,title:^(Visual Studio Code)$ "
      "center,title:^(Save File)$ "
      "center,title:^(GeoGebra)$ "
      "center,class:^(Code)$ "

      # windowrule v2 to avoid idle for fullscreen apps
      "idleinhibit fullscreen, class:^(*)$"
      "idleinhibit fullscreen, title:^(*)$"
      "idleinhibit fullscreen, fullscreen:1"

      # windowrule v2 - float
      "float, title:^(Picture-in-Picture)$"

      # windowrule v2 - opacity
      # "opacity 0.9 0.8, class:^(Alacritty|kitty|kitty-dropterm)$ # Terminals"

      # windowrule v2 - size
      "size 25% 25%, title:^(Picture-in-Picture)$"
      "size 25% 50%, class:protonvpn-app"
      "size 50% 50%,title:^(Image Information — Gwenview)$ "

      # windowrule v2 - pinning
      "pin,title:^(Picture-in-Picture)$"

      # windowrule v2 - extras
      "keepaspectratio, title:^(Picture-in-Picture)$"

      # Ignore maximize requests from apps. You'll probably like this.
      "suppressevent maximize, class:.*"

      # Fix some dragging issues with XWayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];

    # Assigning workspace to a certain monitor
    workspace = [
      "1, monitor:eDP-1"
      "2, monitor:desc:ASUSTek COMPUTER INC VG27AQ1A LBLMQS008039, default:true"
    ];
  };
}
