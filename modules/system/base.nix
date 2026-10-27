{ config, pkgs, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.auto-optimise-store = true;
  # flakes only; NIX_PATH and the registry already point at the flake's nixpkgs
  nix.channel.enable = false;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    vim
    imagemagick
    smartmontools # smartctl for manual checks; smartd itself doesn't put it on PATH
  ];

  services.fwupd.enable = true;
  # fwupd-refresh.timer only fetches metadata, so nag weekly when something is installable
  systemd.user.services.fwupd-notify = {
    description = "Notify about available firmware updates";
    serviceConfig.Type = "oneshot";
    # exits 0 if updates are available, 2 if nothing to do
    script = ''
      if ${config.services.fwupd.package}/bin/fwupdmgr get-updates >/dev/null 2>&1; then
        ${pkgs.libnotify}/bin/notify-send -i software-update-available \
          "Firmware updates available" "Please run: fwupdmgr update"
      fi
    '';
  };
  systemd.user.timers.fwupd-notify = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true; # catch up if the laptop was off
    };
  };
  # SSD health: desktop notification when SMART reports problems
  services.smartd = {
    enable = true;
    notifications.systembus-notify.enable = true;
  };
  services.thermald.enable = true; # Intel thermal management
  zramSwap.enable = true;
}
