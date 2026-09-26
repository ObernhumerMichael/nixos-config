{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt
    jetbrains.idea
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  imports = [
    ./vscode.nix
  ];
}
