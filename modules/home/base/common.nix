{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    tree
    neovim
    brightnessctl
    ddcutil
  ];

  imports = [
    ./stylix.nix
    ./shell.nix
    ./git.nix
    ./kitty.nix
    ./rofi.nix
    ./waybar/waybar.nix
  ];
}
