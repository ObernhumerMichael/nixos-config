{ ... }:

{
  imports = [
    ../../modules/home/base/stylix.nix
    ../../modules/home/base/zsh.nix
    ../../modules/home/base/git.nix
    ../../modules/home/base/kitty.nix
    ../../modules/home/cli/common.nix
    ../../modules/home/dev/common.nix
    ../../modules/home/applications/common.nix
    ../../modules/home/gnome/gnome.nix
  ];

  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "25.05";

    sessionVariables = {
      EDITOR = "vim";
      VISUAL = "vim";
      BROWSER = "brave";
      GPG_TTY = "$(tty)";
      # Override GNOME gcr-ssh-agent so SSH goes through gpg-agent (YubiKey).
      SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh";
    };
  };
}
