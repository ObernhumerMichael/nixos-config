{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/system-tools.nix
    ../../modules/home/dev-tools.nix
    ../../modules/home/hypr/hyprland.nix
    ../../modules/home/apps/firefox.nix
    ../../modules/home/stylix.nix
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
