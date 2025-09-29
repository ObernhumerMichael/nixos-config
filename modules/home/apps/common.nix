{ config, pkgs, ... }:

{
  imports = [
    ./anki.nix
    ./obsidian.nix
    ./security.nix
    ./office.nix
    ./usb.nix
  ];
}
