{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    tree
    neovim
    brightnessctl
  ];

  imports = [
    ./stylix.nix
    ./shell.nix
    ./git.nix
    ./kitty.nix
    ./rofi.nix
    ./waybar.nix
  ];
}
