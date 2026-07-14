{ config, pkgs, ... }:

{
  services.nextcloud-client = {
    enable = true;
    startInBackground = false;
  };

  home.packages = with pkgs; [
    nextcloud-client
  ];
}
