{ pkgs, ... }:

{
  programs.anki = {
    enable = true;
    theme = "dark";
    addons = [
      (pkgs.ankiAddons.anki-connect.withConfig {
        config.webCorsOriginList = [
          "http://localhost"
          "app://obsidian.md"
        ];
      })
    ];
  };
}
