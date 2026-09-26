{ pkgs, ... }:

{
  imports = [ ./tmux.nix ];

  home.packages = with pkgs; [
    htop
    tree
    neovim

    fastfetch
    net-tools
    dig
    speedtest-cli
    mtr

    unzip
    zip
    p7zip
    rsync
    wl-clipboard
    jq
    tldr
  ];

  services.tldr-update.enable = true;

  programs.bat.enable = true;
  programs.ripgrep.enable = true;
  programs.zoxide.enable = true;
  programs.btop = {
    enable = true;
    settings.vim_keys = true;
  };
  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
  };
  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--height 40%"
      "--layout reverse"
      "--border"
    ];
    fileWidget.options = [
      "--preview 'bat --style=numbers --color=always {}'"
    ];
  };
}
