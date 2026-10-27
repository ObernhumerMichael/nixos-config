{ pkgs, ... }:

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

    # Rootless: the daemon runs as the user, so no root-equivalent docker group
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  programs.virt-manager.enable = true;
}
