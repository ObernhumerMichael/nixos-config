{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Michael Obernhumer";
        email = "michaelobernhumer@gmail.com";
      };
      color.ui = "auto";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.diff-so-fancy = {
    enable = true;
  };
}
