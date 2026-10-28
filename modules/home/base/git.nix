{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Michael Obernhumer";
        email = "michaelobernhumer@gmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
    };

    # Sign all commits and tags with the YubiKey signing subkey
    signing = {
      format = "openpgp";
      key = "0x335020D3DDAB1C93";
      signByDefault = true;
    };

    # University repos: student identity, no signing with the private key
    includes = [
      {
        condition = "gitdir:~/dev/pp/";
        contents = {
          user.email = "e12523098@student.tuwien.ac.at";
          commit.gpgSign = false;
          tag.gpgSign = false;
        };
      }
    ];
  };

  programs.diff-so-fancy.enable = true;
}
