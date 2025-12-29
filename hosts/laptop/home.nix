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
      JAVA_HOME = "${pkgs.jdk21}";
      PATH = "${pkgs.jdk21}/bin:$HOME/bin:$PATH";
      GPG_TTY = "$(tty)";
      SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/keyring/ssh";
    };
  };

  programs.home-manager.enable = true;
}
