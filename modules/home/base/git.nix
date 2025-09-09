{ ... }:
{
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;

    userName = "Michael Obernhumer";
    userEmail = "michaelobernhumer@gmail.com";

    extraConfig = {
      color.ui = "auto";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
