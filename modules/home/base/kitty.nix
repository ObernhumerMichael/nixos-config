{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    extraConfig = ''
      font_size 11.0
      confirm_os_window_close 0

      scrollback_lines 10000
      wheel_scroll_min_lines 1

      enable_audio_bell no

      window_padding_width 0
      window_margin_width 0
    '';
  };
}
