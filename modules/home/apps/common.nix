{ config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./anki.nix
    ./obsidian.nix
    ./security.nix
    ./office.nix
    ./usb.nix
  ];
}
