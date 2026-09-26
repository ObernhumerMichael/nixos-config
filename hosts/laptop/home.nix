{ ... }:

{
  imports = [
    ../../modules/home/base
    ../../modules/home/cli
    ../../modules/home/dev
    ../../modules/home/applications
    ../../modules/home/gnome
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
