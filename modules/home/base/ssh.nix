{ ... }:

let
  # Key on disk; the YubiKey one is only a public key, gpg-agent holds the private part
  ed25519 = "~/.ssh/id_ed25519";
  yubikey = "~/.ssh/id_gpg_yubikey";
  pp = "~/.ssh/pp_rsa";
in
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "vps" = {
        HostName = "159.195.52.52";
        User = "admin";
        IdentityFile = ed25519;
        IdentitiesOnly = true;
      };

      "github.com" = {
        User = "git";
        IdentityFile = yubikey;
        IdentitiesOnly = true;
      };

      "raspi1-l" = {
        HostName = "192.168.10.210";
        User = "admin";
        IdentityFile = ed25519;
        IdentitiesOnly = true;
      };

      "raspi1-r" = {
        HostName = "michaelobernhumer.duckdns.org";
        User = "admin";
        IdentityFile = ed25519;
        IdentitiesOnly = true;
      };

      # for the pp git repo
      "g0.complang.tuwien.ac.at" = {
        User = "gitolite3";
        IdentityFile = pp;
        IdentitiesOnly = true;
      };
    };
  };
}
