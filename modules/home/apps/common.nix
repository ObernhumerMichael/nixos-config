{ config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./anki.nix
    ./security.nix
    ./office.nix
    ./usb.nix
  ];
}
