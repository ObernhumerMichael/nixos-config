{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt
    claude-code
    nodejs
    rstudio
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  imports = [
    ./vscode.nix
  ];
}
