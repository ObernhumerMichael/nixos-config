{ pkgs, ... }:

{
  programs.anki = {
    enable = true;
    # unstable: collection was last written by Anki 26.09; 25.09 on 26.05 would be a downgrade
    package = pkgs.unstable.anki;
    theme = "dark";
    addons = [
      (pkgs.unstable.ankiAddons.anki-connect.withConfig {
        config.webCorsOriginList = [
          "http://localhost"
          "app://obsidian.md"
        ];
      })
    ];
  };
}
