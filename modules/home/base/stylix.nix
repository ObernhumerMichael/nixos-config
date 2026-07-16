{ config, pkgs, ... }:

{
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
}
