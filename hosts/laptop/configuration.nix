{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/common.nix
    ../../modules/system/nvidia.nix
    ../../modules/system/desktop/hyprland.nix
  ];

  networking.hostName = "laptop";
  time.timeZone = "Europe/Vienna";
  system.stateVersion = "25.05";
  hardware.i2c.enable = true;
  boot = {

    loader = {
      systemd-boot.enable = false;

      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
      efi.canTouchEfiVariables = true;
    };

    initrd.luks.devices."luks-282bd651-de34-4805-a7e1-dd3371cc8add".device =
      "/dev/disk/by-uuid/282bd651-de34-4805-a7e1-dd3371cc8add";
  };
}
