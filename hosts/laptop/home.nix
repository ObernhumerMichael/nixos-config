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
      GPG_TTY = "$(tty)";
      SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh";
    };
  };

  programs.home-manager.enable = true;
}
