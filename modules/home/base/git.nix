{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Michael Obernhumer";
        email = "michaelobernhumer@gmail.com";
      };
      commit = {
        gpgSign = true;
      };
      color.ui = "auto";
      init.defaultBranch = "main";
      pull.rebase = false;
    };

    # GPG signing configuration
    signing = {
      format = "openpgp"; # use OpenPGP (your YubiKey)
      key = "0x335020D3DDAB1C93"; # the signing subkey on YubiKey
      signByDefault = true; # sign all commits and tags
      # signer = null   # optional: path to gpg if needed, usually auto-detected
    };
  };

  programs.diff-so-fancy = {
    enable = true;
  };
}
