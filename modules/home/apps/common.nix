{ config, pkgs, ... }:

{
  imports = [
    ./anki.nix
    ./security.nix
    ./office.nix
    ./usb.nix
    ./spotify.nix
    ./science.nix
    ./firefox.nix
    ./media.nix
  ];

  home.packages = with pkgs; [
    (discord.override {
      withVencord = true;
    })
  ];

  programs.obsidian = {
    enable = true;
  };
}
