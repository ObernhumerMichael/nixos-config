{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../modules/system
  ];

  networking.hostName = "laptop";
  time.timeZone = "Europe/Vienna";
  system.stateVersion = "25.05";

  # DDC/CI brightness control for external monitors (ddcutil)
  hardware.i2c.enable = true;

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        # keep old kernels from filling the 1 GB /boot
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };

    initrd.luks.devices = {
      "luks-282bd651-de34-4805-a7e1-dd3371cc8add".device =
        "/dev/disk/by-uuid/282bd651-de34-4805-a7e1-dd3371cc8add";
      # pass TRIM through LUKS so the weekly fstrim actually reaches the SSD
      # (leaks which blocks are free, not their contents)
      "luks-282bd651-de34-4805-a7e1-dd3371cc8add".allowDiscards = true;
      "luks-8bb163a9-9505-4693-923f-c0d7e3f8fe32".allowDiscards = true; # root, defined in hardware-configuration.nix
    };

    # hibernate into the encrypted swap partition (zram can't hold an image)
    resumeDevice = "/dev/mapper/luks-282bd651-de34-4805-a7e1-dd3371cc8add";
  };

  # lid closed: suspend, then hibernate after 2h to stop battery drain
  services.logind.settings.Login.HandleLidSwitch = "suspend-then-hibernate";
  systemd.sleep.settings.Sleep.HibernateDelaySec = "2h";
}
