{
  inputs,
  config,
  pkgs,
  ...
}:

{
  services.hyprpolkitagent.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      pkgs.hyprlandPlugins.hyprexpo
    ];
  };

  imports = [
    ./base/keybindings.nix
    ./base/env.nix
    ./base/inputs.nix
    ./base/layouts.nix
    ./base/monitors.nix
    ./base/rules.nix
    ./base/looks.nix
    ./base/animations.nix
    ./base/other.nix
    ./base/autostart.nix
    ./plugins/hyprexpo.nix
  ];
}
