{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/hypr/hyprland.nix
    ../../modules/home/apps/firefox.nix
    ../../modules/home/apps/anki.nix
    ../../modules/home/apps/security.nix
    ../../modules/home/apps/office.nix
    ../../modules/home/apps/usb.nix
    ../../modules/home/stylix.nix
  ];

  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "25.05";

    sessionVariables = {
      EDITOR = "vim";
      BROWSER = "firefox";
      PATH = "$HOME/bin:$PATH";
    };
  };

  programs.home-manager.enable = true;
}
