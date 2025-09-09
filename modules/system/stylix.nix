{
  pkgs,
  lib,
  config,
  ...
}:

let
  theme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  sourceImage = ../../wallpapers/nix-center.png;

  recolored = pkgs.runCommand "recolored-wallpaper.png" { } ''
    set -euo pipefail

    # Extract base16 palette into an image colormap.png
    COLORS="$(${lib.getExe pkgs.yq} -r '.palette | to_entries | .[].value' ${theme})"

    if [ -z "$COLORS" ]; then
      echo "No colors extracted from theme!" >&2
      exit 1
    fi

    rm -f colormap.txt
    for C in $COLORS; do
      echo "xc:$C" >> colormap.txt
    done

    # Build colormap image by stacking them horizontally
    ${lib.getExe pkgs.imagemagick} $(cat colormap.txt) +append colormap.png

    # Quantize source image to those theme colors (colormap remap)
    ${lib.getExe pkgs.imagemagick} ${sourceImage} +dither -remap colormap.png $out
  '';
in
{
  stylix = {
    enable = true;

    image = ../../wallpapers/catppuccin.png;
    # Use recolored to repaint a wallpaper into the colors of the current base16 theme.
    # image = recolored;
    base16Scheme = theme;

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
