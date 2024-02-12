{ config, pkgs, ... }:

{
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Steam Remote Play.
        dedicatedServer.openFirewall = true; # Source Dedicated Server.
    };

    environment.systemPackages = with pkgs; [
        gamemode
        mangohud
    ];
}
