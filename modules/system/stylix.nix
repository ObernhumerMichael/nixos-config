{ pkgs, ... }:

let
  theme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
in
{
  stylix = {
    enable = true;

    image = ../../wallpapers/catppuccin.png;
    base16Scheme = theme;
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    icons = {
      enable = true;
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "blue"; # Options: blue, flamingo, mauve, pink, etc.
      };
      # Note: Stylix uses these names to set GTK icon themes
      light = "Papirus-Dark"; # Papirus-Dark usually looks better even on light themes
      dark = "Papirus-Dark";
    };

    fonts = {
      serif = {
        package = pkgs.inter;
        name = "Inter";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      emoji = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
    };
  };
}
