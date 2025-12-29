{ config, pkgs, ... }:

{
  security.polkit.enable = true;
  security.pam.services.hyprlock = { };

  environment.systemPackages = with pkgs; [
    gnupg
    pinentry-gnome3 # or pinentry-qt / pinentry-tty
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true; # lets gpg-agent handle SSH keys
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  services.pcscd.enable = true; # Required for YubiKey smartcard

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
}
