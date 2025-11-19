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
    speedtest-cli
  ];

  imports = [
    ./base/btop.nix
    ./base/zoxide.nix
    ./base/eza.nix
    ./base/tmux.nix
    ./base/bat.nix
    ./base/ripgrep.nix
    ./base/tldr.nix
    ./base/fzf.nix
  ];
}
