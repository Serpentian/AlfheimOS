{ config, pkgs, ... }:

{

    hardware.xpadneo.enable = true; # Xbox controller.

    programs.steam = {
        enable = true;
        # remotePlay.openFirewall = true; # Steam Remote Play.
        # dedicatedServer.openFirewall = true; # Source Dedicated Server.
        extraCompatPackages = with pkgs; [ proton-ge-bin ];
        gamescopeSession = {
            enable = true;
        };
    };

    programs.gamemode = {
        enable = true;
        enableRenice = true;
        settings = {
            general = {
                renice = 20;
            };
        };
    };

    environment.systemPackages = with pkgs; [
        (mangohud.override { lowerBitnessSupport = true; })
        gamescope
    ];

    # Disable DS touchpad as mouse;
    services.udev.extraRules = ''
ACTION=="add|change" ATTRS{name}=="Sony Interactive Entertainment DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
# Bluetooth
ACTION=="add|change" ATTRS{name}=="DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    '';
}
