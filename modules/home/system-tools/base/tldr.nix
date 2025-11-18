{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tldr
  ];
  services.tldr-update.enable = true;
}
