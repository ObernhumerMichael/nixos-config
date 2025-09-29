{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    gimp
    system-config-printer
    simple-scan
    brave
  ];

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  programs.ranger.enable = true;
}
