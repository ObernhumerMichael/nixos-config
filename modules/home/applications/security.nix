{ pkgs, ... }:

{
  home.packages = with pkgs; [
    seahorse
    openconnect
  ];

  programs.keepassxc.enable = true;
}
