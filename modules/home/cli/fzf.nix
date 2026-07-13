{ config, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
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
