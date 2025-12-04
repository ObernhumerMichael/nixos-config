{ config, pkgs, ... }:

{
  imports = [
    ./base/common.nix
    ./system-tools/common.nix
    ./dev-tools/common.nix
    ./apps/common.nix
  ];
}
