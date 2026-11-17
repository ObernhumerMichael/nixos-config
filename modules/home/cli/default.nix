{ pkgs, ... }:

{
  imports = [
    ./tmux.nix
    ./nix-index.nix
    ./neovim.nix
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
    # HM 26.05 option name; newer HM renames it to fileWidget.options
    fileWidgetOptions = [
      "--preview 'bat --style=numbers --color=always {}'"
    ];
    # no Ctrl+R opt-out in HM 26.05; atuin's zsh init (order 1000) runs after fzf's (910) and wins
  };
}
