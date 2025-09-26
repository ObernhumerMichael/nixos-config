{ config, pkgs, ... }:

{
  services.udisks2.enable = true;
  services.pcscd.enable = true;
}
