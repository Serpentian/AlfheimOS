{ config, ...}:
{
    imports = [
        ./ncmpcpp.nix
    ];

    services.mpd = {
        enable = true;
        musicDirectory = "${config.home.homeDirectory}/Drives/hdd/Music";
    };
}
