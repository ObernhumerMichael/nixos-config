{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    jdk21
    maven
    gradle
  ];
}
