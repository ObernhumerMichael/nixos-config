{ pkgs, ... }:

{
  imports = [
    ./tmux.nix
    ./nix-index.nix
  ];

  home.packages = with pkgs; [
    tree

    fastfetch
    dig
    speedtest-cli
    mtr

    man-pages
    man-pages-posix

    unzip
    zip
    p7zip
    rsync
    wl-clipboard
    jq
    tldr
  ];

  services.tldr-update.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
  };

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
