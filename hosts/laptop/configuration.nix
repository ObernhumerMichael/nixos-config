{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../modules/system
    ../../modules/system/gnome.nix
  ];

  networking.hostName = "laptop";
  time.timeZone = "Europe/Vienna";
  system.stateVersion = "25.05";

  # DDC/CI brightness control for external monitors (ddcutil)
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
