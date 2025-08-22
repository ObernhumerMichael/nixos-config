{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/hypr/hyprland.nix
    ../../modules/home/apps/firefox.nix
    ../../modules/home/apps/anki.nix
    ../../modules/home/apps/security.nix
    ../../modules/home/stylix.nix
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
