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

  # services.gpg-agent = {
  #   enable = true;
  #   defaultCacheTtl = 1800;
  #   enableSshSupport = true;
  #   pinentry.package = pkgs.pinentry-gnome3;
  # };

  programs.gpg.enable = true;

}
