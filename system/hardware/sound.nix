{ config, pkgs, ... }:

{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.pipewire.extraConfig.pipewire = {
      "10-clock-rate" = {
          "context.properties" = {
              "default.clock.allowed-rates" = [ 44100 48000 96000 ];
          };
      };
  };
}
