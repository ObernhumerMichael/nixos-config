# All theming in one place: Stylix (system + Home Manager targets) and Qt.
{ pkgs, lib, ... }:

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

  # Qt: the system and the user session both use qtct as the platform theme.
  qt = {
    platformTheme = lib.mkForce "qt5ct";
    style = lib.mkForce null;
  };

  home-manager.users.user = {
    stylix.targets = {
      firefox = {
        enable = true;
        profileNames = [ "default" ];
        colorTheme.enable = true;
      };
      vscode.enable = false;

      qt = {
        enable = true;
        platform = "qtct";
      };
    };

    # qt5ct/qt6ct needs to actually be the platform theme backend used
    qt = {
      enable = true;
      platformTheme.name = "qtct";
    };
  };
}
