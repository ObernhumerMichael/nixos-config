{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.idea-community
    texlive.combined.scheme-full
    qalculate-qt
    geogebra6
  ];
}
