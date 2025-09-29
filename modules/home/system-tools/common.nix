{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    htop
    fastfetch
    unzip
    rsync
    net-tools
    dig
    zip
  ];

  imports = [
    ./base/btop.nix
    ./base/zoxide.nix
    ./base/eza.nix
    ./base/tmux.nix
  ];
}
