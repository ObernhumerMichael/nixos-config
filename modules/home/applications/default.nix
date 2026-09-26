{ pkgs, ... }:

{
  imports = [
    ./anki.nix
    ./security.nix
    ./office.nix
    ./files.nix
    ./spotify.nix
    ./science.nix
    ./browsers.nix
    ./media.nix
  ];

  home.packages = [ (pkgs.discord.override { withVencord = true; }) ];

  programs.obsidian.enable = true;
}
