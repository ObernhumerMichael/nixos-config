{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt
    # jetbrains.idea
  ];

  imports = [
    ./vscode.nix
    ./languages.nix
  ];
}
