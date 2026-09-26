# GPG + SSH via the YubiKey: gpg-agent (system), gpg config and tools (user).
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnupg
    pinentry-gnome3
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true; # lets gpg-agent handle SSH keys
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  services.pcscd.enable = true; # Required for YubiKey smartcard

  home-manager.users.user = {
    programs.gpg.enable = true;

    home.packages = with pkgs; [
      yubioath-flutter
      yubikey-manager
    ];

    home.sessionVariables = {
      GPG_TTY = "$(tty)";
      # Override GNOME gcr-ssh-agent so SSH goes through gpg-agent (YubiKey).
      SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh";
    };
  };
}
