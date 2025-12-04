{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    clock24 = true;
    prefix = "C-a";
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "a";
  };
}
