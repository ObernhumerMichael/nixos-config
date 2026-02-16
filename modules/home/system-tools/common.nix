{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    htop

    fastfetch
    net-tools
    dig
    speedtest-cli
    mtr

    unzip
    zip
    rsync
    wl-clipboard
    jq
  ];

  imports = [
    ./btop.nix
    ./zoxide.nix
    ./eza.nix
    ./tmux.nix
    ./bat.nix
    ./ripgrep.nix
    ./tldr.nix
    ./fzf.nix
  ];
}
