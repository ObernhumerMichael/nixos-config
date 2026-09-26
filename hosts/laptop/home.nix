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
    };
  };
}
