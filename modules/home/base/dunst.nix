{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    libnotify
  ];

  services.dunst = {
    enable = true;

    settings = {
      global = {
        corner_radius = 10;
        frame_width = 2;
      };
    };
  };
}
