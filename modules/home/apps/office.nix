{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    gimp
    system-config-printer
    simple-scan
    brave
    libreoffice-qt
    hunspell
    hunspellDicts.de_AT
    hunspellDicts.en_US
    google-chrome
  ];

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  programs.ranger.enable = true;
}
