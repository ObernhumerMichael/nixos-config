{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    jetbrains.idea
  ];

  imports = [
    ./vscode.nix
    ./languages.nix
  ];
}
