{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        swaynotificationcenter
    ];

    xdg.configFile.swaync = {
        source = ../../../non-nix/swaync;
        recursive = true;
    };
}
