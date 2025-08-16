{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
  ];

  imports = [
    ./base/vscode.nix
  ];
}
