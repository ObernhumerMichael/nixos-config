{ ... }:

{
  imports = [
    ./base.nix
    ./networking.nix
    ./bluetooth.nix
    ./locale.nix
    ./users.nix
    ./stylix.nix
    ./printer.nix
    ./security.nix
    ./gc.nix
    ./system-audio.nix
    ./virtualisation.nix
    ./nix-ld.nix
    ./qt.nix
  ];
}
