{ pkgs, ... }:

{
  # mDNS (UDP 5353) is opened by services.avahi.openFirewall in printer.nix
  networking.networkmanager = {
    enable = true;
    plugins = [ pkgs.networkmanager-openconnect ];
  };
}
