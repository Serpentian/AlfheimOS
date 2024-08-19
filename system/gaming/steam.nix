{ config, pkgs, ... }:

{
    hardware.xpadneo.enable = true;
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Steam Remote Play.
        dedicatedServer.openFirewall = true; # Source Dedicated Server.
    };

    programs.steam.package = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [
            libgdiplus
            keyutils
            libkrb5
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
        ];
    };

    programs.gamemode = {
        enable = true;
        enableRenice = true;
        settings = {
            general = {
                renice = -19;
            };
        };
    };

    environment.systemPackages = with pkgs; [
        (mangohud.override { lowerBitnessSupport = true; })
        gamescope
        # gamemode
    ];
}
