{ inputs, ... }:

{
  # Prebuilt weekly nix-index database instead of building it locally
  imports = [ inputs.nix-index-database.homeModules.nix-index ];

  programs.nix-index.enable = true; # command-not-found hook + nix-locate
  programs.nix-index-database.comma.enable = true; # `, <program>` runs without installing
}
