{ pkgs, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.auto-optimise-store = true;
  # flakes only; NIX_PATH and the registry already point at the flake's nixpkgs
  nix.channel.enable = false;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    vim
    imagemagick
  ];

  services.fwupd.enable = true;
  services.thermald.enable = true; # Intel thermal management
  zramSwap.enable = true;
}
