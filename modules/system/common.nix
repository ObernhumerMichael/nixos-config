{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
    ./fonts.nix
    ./cachix.nix
    ./networking.nix
    ./bluetooth.nix
    ./locale.nix
    ./users.nix
    ./stylix.nix
    ./printer.nix
    ./usb.nix
  ];
}
