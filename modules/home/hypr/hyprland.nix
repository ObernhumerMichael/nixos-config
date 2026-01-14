{
  inputs,
  config,
  pkgs,
  ...
}:

{
  services.hyprpolkitagent.enable = true;

  home.packages = with pkgs; [
    grimblast
    brightnessctl
    ddcutil
    playerctl
    wev
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };

  imports = [
    ./base/keybindings.nix
    ./base/inputs.nix
    ./base/layouts.nix
    ./base/monitors.nix
    ./base/rules.nix
    ./base/looks.nix
    ./base/animations.nix
    ./base/other.nix
    ./base/autostart.nix
    ./ecosystem/hyprlock.nix
    ./ecosystem/hyprsunset.nix
    # ./ecosystem/hypridle.nix
    ./ecosystem/pyprland.nix
    ./ecosystem/hyprpaper.nix
  ];
}
