{ inputs, pkgs, ... }:
{
  services.xserver.enable = true;

  programs.hyprland = {
    enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
