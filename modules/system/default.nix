{ ... }:

{
  imports = [
    ./base.nix
    ./networking.nix
    ./bluetooth.nix
    ./locale.nix
    ./users.nix
    ./theming.nix
    ./printer.nix
    ./gpg.nix
    ./gc.nix
    ./system-audio.nix
    ./virtualisation.nix
    ./nix-ld.nix
  ];
}
