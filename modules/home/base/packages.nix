{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    firefox
    kitty
    tree
    neovim
  ];
}
