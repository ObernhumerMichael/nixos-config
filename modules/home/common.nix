{ ... }:
{
  imports = [
    ./base/packages.nix
    ./base/shell.nix
    ./base/git.nix
    ./base/kitty.nix
    ./system-tools.nix
    ./dev-tools.nix
  ];
}
