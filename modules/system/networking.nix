{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  networking = {
    networkmanager = {
      enable = true;
      plugins = [ pkgs.networkmanager-openconnect ];
    };

    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 22 ];  # SSH
      allowedUDPPorts = [ 5353 ];  # mDNS for local discovery
    };
  };
}
