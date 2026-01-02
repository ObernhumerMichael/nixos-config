{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.pyprland
  ];

  ############################################################
  # pyprland configuration file
  ############################################################
  xdg.configFile."hypr/pyprland.toml".text = ''
    [pyprland]

     plugins = [
       "scratchpads",
       "magnify"
     ]

     [scratchpads.term]
     animation = "fromTop"
     command = "kitty --class kitty-dropterm"
     class = "kitty-dropterm"
     size = "75% 60%"
     lazy = true
  '';

}
