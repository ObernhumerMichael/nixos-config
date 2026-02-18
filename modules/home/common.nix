{ config, pkgs, ... }:

{
  imports = [
    ./base/common.nix
    ./cli/common.nix
    ./dev/common.nix
    ./applications/common.nix
  ];
}
