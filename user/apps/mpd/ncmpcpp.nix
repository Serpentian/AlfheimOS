{config, ...}:
{
    programs.ncmpcpp = {
        enable = true;
        mpdMusicDir = "${config.home.homeDirectory}/Drives/hdd/Music";
    };
}
