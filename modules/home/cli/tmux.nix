{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    clock24 = true;
    mouse = true;
    terminal = "tmux-256color"; # default "screen" breaks true color + italics in nvim
    baseIndex = 1; # window 1 = key 1
    escapeTime = 0; # no lag on Esc in nvim
    historyLimit = 50000;

    plugins = with pkgs.tmuxPlugins; [
      sensible # sane defaults
      yank # system clipboard integration
      resurrect # restore tmux sessions
      continuum # auto-save + auto-restore
      vim-tmux-navigator # seamless navigation between tmux panes and vim splits
      tmux-fzf # fzf integration
    ];

    extraConfig = ''
      set -as terminal-features ",xterm-kitty:RGB"
      set -g renumber-windows on

      # new splits/windows open in the current directory
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # Resurrect settings
      set -g @resurrect-capture-pane-contents 'on'

      # Continuum settings
      set -g @continuum-restore 'on'
    '';
  };
}
