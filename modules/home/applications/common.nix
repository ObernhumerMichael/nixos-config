{ pkgs, ... }:

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
    ./nextcloud.nix
  ];

  home.packages = [ (pkgs.discord.override { withVencord = true; }) ];

  programs.obsidian.enable = true;
}
