{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lshw
    mesa-demos
  ];

  services.xserver.videoDrivers = [
    "modesetting" # Intel iGPU
    "nvidia"
  ];

  hardware.nvidia = {
    # Saves full VRAM on suspend; fixes corruption/crashes after wake.
    powerManagement.enable = true;
    # Turns off the GPU when idle (Turing or newer).
    powerManagement.finegrained = true;
    # Proprietary kernel module, not the open one.
    open = false;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
