{ ... }:

{
  # GNOME already enables pipewire with pulse support.
  services.pipewire = {
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;

    extraConfig.pipewire-pulse = {
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
  };
}
