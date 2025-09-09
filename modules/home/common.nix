{ ... }:
{
  imports = [
    ./base/packages.nix
    ./base/shell.nix
    ./base/git.nix
    ./base/kitty.nix
    ./base/rofi.nix
    ./base/waybar.nix
    ./system-tools/common.nix
    ./dev-tools/common.nix
  ];
}
