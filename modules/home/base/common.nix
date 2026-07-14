{ config, pkgs, ... }:

{
  imports = [
    ./stylix.nix
    ./zsh.nix
    ./git.nix
    ./kitty.nix
    ./gnome.nix
  ];
}
