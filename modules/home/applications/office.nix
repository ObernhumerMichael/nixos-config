{ pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    evince
    pdfarranger
    drawio

    system-config-printer
    simple-scan

    libreoffice-qt
    hunspell
    hunspellDicts.de_AT
    hunspellDicts.en_US
  ];
}
