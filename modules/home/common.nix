{ ... }:
{
  imports = [
    ./base/packages.nix
    ./base/shell.nix
    ./base/git.nix
    ./base/kitty.nix
    ./base/rofi/rofi.nix
    ./system-tools/common.nix
    ./dev-tools/common.nix
  ];
}
