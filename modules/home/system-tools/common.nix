{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    htop
    fastfetch
  ];

  imports = [
    ./base/btop.nix
    ./base/zoxide.nix
    ./base/eza.nix
  ];
}
