{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/hypr/hyprland.nix
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
