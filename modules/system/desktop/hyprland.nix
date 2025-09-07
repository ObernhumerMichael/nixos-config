{ inputs, pkgs, ... }:
{
  services.xserver.enable = true;

  programs.hyprland = {
    enable = true;
  };

  services.xserver.displayManager.gdm.enable = true;
}
