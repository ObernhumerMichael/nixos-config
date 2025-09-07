{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    gimp
    system-config-printer
    simple-scan
  ];

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
}
