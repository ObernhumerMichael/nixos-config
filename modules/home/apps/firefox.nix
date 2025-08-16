{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      # needed for Stylix to override extensions cleanly
      extensions.force = true;
    };

    languagePacks = [
      "de"
      "en-US"
    ];

    policies = {
      DisplayBookmarksToolbar = "always";
    };
  };
}
