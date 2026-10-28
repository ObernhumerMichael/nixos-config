{
  programs.kitty = {
    enable = true;

    extraConfig = ''
      font_size 11.0
      confirm_os_window_close 0

      scrollback_lines 10000
      enable_audio_bell no
    '';
  };
}
