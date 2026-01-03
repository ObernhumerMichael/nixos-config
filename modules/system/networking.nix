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
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ 5353 ]; # mDNS for local discovery
    };
  };
}
