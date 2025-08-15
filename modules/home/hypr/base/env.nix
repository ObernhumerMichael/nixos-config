{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    env = [
      # ENVIRONMENT VARIABLES
      # See https://wiki.hyprland.org/Configuring/Environment-variables/

      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
      "EDITOR,nvim"
      "BAT_THEME,dotfiles"

      # QT variables
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_QPA_PLATFORM,wayland;xcb "
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "QT_QPA_PLATFORMTHEME,qt6ct "

      # Nvidia
      # "LIBVA_DRIVER_NAME,nvidia"
      # "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    ];
  };
}
