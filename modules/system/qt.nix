{ pkgs, lib, ... }:

{
  qt = {
    platformTheme = lib.mkForce "qt5ct";
    style = lib.mkForce null;
  };
}
