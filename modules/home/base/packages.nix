{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    tree
    neovim
    evince
  ];
}
