{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
  ];

  imports = [
    ./vscode.nix
    ./languages.nix
  ];
}
