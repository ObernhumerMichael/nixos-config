{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/common.nix
    ../../modules/system/nvidia.nix
    ../../modules/system/desktop/hyprland.nix
    # ../../modules/system/desktop/gnome.nix
  ];

  networking.hostName = "laptop";

  # Disable systemd-boot
  boot.loader.systemd-boot.enable = false;

  # Enable GRUB
  boot.loader.grub = {
    enable = true;

    # If EFI system:
    efiSupport = true;
    device = "nodev";
  };

  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-282bd651-de34-4805-a7e1-dd3371cc8add".device =
    "/dev/disk/by-uuid/282bd651-de34-4805-a7e1-dd3371cc8add";

  time.timeZone = "Europe/Vienna";

  system.stateVersion = "25.05";
}
