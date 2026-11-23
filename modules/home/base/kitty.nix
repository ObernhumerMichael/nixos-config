{ config, ... }:

{
  programs.kitty = {
    enable = true;

    extraConfig = ''
      # attach to session "main", or create it if it doesn't exist
      shell ${config.programs.tmux.package}/bin/tmux new-session -A -s main

      font_size 11.0
      confirm_os_window_close 0

      scrollback_lines 10000
      enable_audio_bell no
    '';
  };
}
