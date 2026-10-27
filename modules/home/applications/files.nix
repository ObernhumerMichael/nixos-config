{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    file-roller
    gparted
    veracrypt
    nextcloud-client # desktop entry; the service below only autostarts it
  ];

  programs.ranger.enable = true;

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
}
