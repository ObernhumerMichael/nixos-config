{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    thunderbird
    gimp
    evince
    pdfarranger
    drawio

    system-config-printer
    simple-scan

    brave
    google-chrome

    libreoffice-qt
    hunspell
    hunspellDicts.de_AT
    hunspellDicts.en_US
  ];

  programs.ranger.enable = true;
}
