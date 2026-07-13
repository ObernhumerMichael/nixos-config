{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    qalculate-qt
    geogebra6
    texliveFull
  ];
}
