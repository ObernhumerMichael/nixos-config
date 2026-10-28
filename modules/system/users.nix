{ pkgs, ... }:

{
  # System user configuration
  users.users.user = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # sudo
      "networkmanager" # control network
      "i2c" # I2C devices
      "libvirtd" # manage virtual machines
      "kvm" # use KVM for virtualization
    ];
    shell = pkgs.zsh; # default shell
  };

  # Enable zsh globally (for root + all)
  programs.zsh.enable = true;
}
