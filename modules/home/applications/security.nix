{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    veracrypt

    yubioath-flutter
    yubikey-manager

    tor-browser
    openconnect

    seahorse
  ];

  programs.gpg.enable = true;
  programs.keepassxc.enable = true;
}
