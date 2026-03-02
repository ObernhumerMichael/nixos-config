{ config, pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      # Required for Windows 11 and secure boot
      swtpm.enable = true;
      # Required for high-performance file sharing (VirtioFS)
      vhostUserPackages = [ pkgs.virtiofsd ];
    };
  };
  programs.virt-manager.enable = true;
}
