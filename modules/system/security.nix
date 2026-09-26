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
}
