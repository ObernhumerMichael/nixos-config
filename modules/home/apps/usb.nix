{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gparted
  ];

  services.udiskie = {
    enable = true;
  };
}
