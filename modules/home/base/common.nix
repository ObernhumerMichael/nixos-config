{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    tree
    neovim
  ];

  imports = [
    ./stylix.nix
    ./shell.nix
    ./git.nix
    ./kitty.nix
    # ./rofi.nix
    # ./waybar/waybar.nix
    # ./dunst.nix
    ./caelestia.nix
  ];
}
