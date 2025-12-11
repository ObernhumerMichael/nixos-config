{ config, pkgs, ... }:

{
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.pipewire.extraConfig.pipewire-pulse = {
    "virtual-sink" = {
      "media.class" = "Audio/Sink";
      "node.name" = "virtual_speaker";
      "node.description" = "Virtual Speaker";
      "audio.position" = [
        "FL"
        "FR"
      ];
      "monitor.channel-volumes" = true;
    };
  };
}
