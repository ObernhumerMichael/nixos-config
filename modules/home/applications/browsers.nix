{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    firefox # unconfigured, only for testing
    tor-browser
  ];
}
