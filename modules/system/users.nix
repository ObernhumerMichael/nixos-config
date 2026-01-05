{ config, pkgs, ... }:

{
  # System user configuration
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [
      "wheel" # sudo
      "networkmanager" # control network
      "video" # access GPU acceleration
      "audio" # sound
      "input" # input devices
      "i2c" # I2C devices
    ];
    shell = pkgs.zsh; # default shell
  };

  # Enable zsh globally (for root + all)
  programs.zsh.enable = true;
}
