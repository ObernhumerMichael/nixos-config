{ inputs, pkgs, ... }:
{
  services.xserver.enable = true;

  programs.hyprland = {
    enable = true;
  };

  services.displayManager.gdm.enable = true;
}
