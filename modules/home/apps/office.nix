{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    thunderbird
    gimp
    evince
    zoom-us

    system-config-printer
    simple-scan

    brave
    google-chrome

    libreoffice-qt
    hunspell
    hunspellDicts.de_AT
    hunspellDicts.en_US
  ];

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

  programs.ranger.enable = true;
}
