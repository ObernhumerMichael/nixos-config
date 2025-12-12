{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bitwarden-desktop
    veracrypt

    yubioath-flutter
    yubikey-manager

    tor-browser
    openconnect
  ];

  programs.gpg.enable = true;
}
