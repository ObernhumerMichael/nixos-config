{ config, pkgs, ... }:

{
  imports = [
    ./stylix.nix
    ./zsh.nix
    ./git.nix
    ./kitty.nix
    ./caelestia.nix
  ];
}
