{ config, pkgs, ... }:
{
    programs.lutris = {
        enable = true;
        protonPackages = [ pkgs.proton-ge-bin ];
        extraPackages = with pkgs; [
            mangohud
            winetricks
            gamescope
            gamemode
            umu-launcher
        ];
    };
}
