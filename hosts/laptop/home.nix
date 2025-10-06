{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/hypr/hyprland.nix
    ../../modules/home/dev-tools/uni.nix
    ../../modules/home/apps/firefox.nix
  ];

  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "25.05";

    sessionVariables = {
      EDITOR = "vim";
      BROWSER = "firefox";
      JAVA_HOME = "${pkgs.jdk21}";
      PATH = "${pkgs.jdk21}/bin:$HOME/bin:$PATH";
    };
  };

  programs.home-manager.enable = true;
}
