{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    clock24 = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible # sane defaults
      yank # system clipboard integration
      resurrect # restore tmux sessions
      continuum # auto-save + auto-restore
      vim-tmux-navigator # seamless navigation between tmux panes and vim splits
      tmux-fzf # fzf integration
    ];

    extraConfig = ''
      # Resurrect settings
      set -g @resurrect-capture-pane-contents 'on'

      # Continuum settings
      set -g @continuum-restore 'on'
    '';
  };
}
