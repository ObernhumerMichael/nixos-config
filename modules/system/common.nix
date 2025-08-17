{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
    ./cachix.nix
    ./networking.nix
    ./bluetooth.nix
    ./locale.nix
    ./users.nix
    ./stylix.nix
  ];
}
