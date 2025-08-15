{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/common.nix
    ../../modules/system/desktop/hyprland.nix
  ];

  networking.hostName = "laptop";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-282bd651-de34-4805-a7e1-dd3371cc8add".device =
    "/dev/disk/by-uuid/282bd651-de34-4805-a7e1-dd3371cc8add";

  time.timeZone = "Europe/Vienna";

  system.stateVersion = "25.05";
}
