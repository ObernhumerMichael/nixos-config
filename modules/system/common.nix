{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
    ./cachix.nix
    ./networking.nix
    ./locale.nix
    ./users.nix
    ./stylix.nix
  ];
}
