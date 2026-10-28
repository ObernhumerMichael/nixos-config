# GPG + SSH via the YubiKey: gpg-agent (system), gpg config and tools (user).
{ pkgs, ... }:

{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true; # lets gpg-agent handle SSH keys
  };

  services.pcscd.enable = true; # Required for YubiKey smartcard

  # GNOME's own SSH agent would claim SSH_AUTH_SOCK; without it the gnupg
  # module points SSH at gpg-agent (and sets GPG_TTY per shell) itself.
  services.gnome.gcr-ssh-agent.enable = false;

  home-manager.users.user = {
    programs.gpg.enable = true;

    home.packages = with pkgs; [
      yubioath-flutter
      yubikey-manager
    ];
  };
}
