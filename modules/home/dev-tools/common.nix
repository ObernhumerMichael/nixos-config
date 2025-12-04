{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    jetbrains.idea-community
  ];

  imports = [
    ./vscode.nix
    ./languages.nix
  ];
}
