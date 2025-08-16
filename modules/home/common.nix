{ ... }:
{
  imports = [
    ./base/packages.nix
    ./base/shell.nix
    ./base/git.nix
    ./base/kitty.nix
    ./system-tools/common.nix
    ./dev-tools.nix
  ];
}
