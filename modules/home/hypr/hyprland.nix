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

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
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
