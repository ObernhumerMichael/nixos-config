{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode
    nixfmt-rfc-style
  ];
}
