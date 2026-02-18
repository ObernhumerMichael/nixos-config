{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # java development
    jdk21
    maven
    gradle

    # python
    python3
  ];
}
