# All theming in one place: Stylix (system + Home Manager targets) and Qt.
{ pkgs, lib, ... }:

{
  stylix = {
    enable = true;

    image = ../../wallpapers/catppuccin.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
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
      dark = "Papirus-Dark"; # Stylix sets the GTK icon theme from this name
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
      # emoji: Stylix default (Noto Color Emoji); Nerd Fonts have no emoji glyphs
    };
  };

  # Qt: the system and the user session both use qtct as the platform theme.
  qt = {
    platformTheme = lib.mkForce "qt5ct";
    style = lib.mkForce null;
  };

  home-manager.users.user = {
    stylix.targets = {
      vscode.enable = false;

      # the NixOS side picks "gnome"; Stylix sets HM qt.enable + platformTheme from this
      qt.platform = "qtct";
    };
  };
}
