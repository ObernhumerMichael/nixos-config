{ config, pkgs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        # Required for Windows 11 and secure boot
        swtpm.enable = true;
        # Required for high-performance file sharing (VirtioFS)
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };

    docker = {
      enable = true;

      # Optional but recommended
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  programs.virt-manager.enable = true;
}
