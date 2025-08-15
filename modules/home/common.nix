{ ... }:
{
  imports = [
    ./base/packages.nix
    ./base/shell.nix
    ./base/git.nix
    ./system-tools.nix
    ./dev-tools.nix
  ];
}
