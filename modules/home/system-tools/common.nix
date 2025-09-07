{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    htop
    fastfetch
    unzip
  ];

  imports = [
    ./base/btop.nix
    ./base/zoxide.nix
    ./base/eza.nix
  ];
}
