{ config, pkgs, ...}:
{
    imports = [
        ./ncmpcpp.nix
        ./mpdscribble.nix
    ];

    home.packages = with pkgs; [
        mpc-cli
    ];

    services.mpd-mpris = {
        enable = true;
        mpd.useLocal = true;
    };

    services.mpd = {
        enable = true;
        musicDirectory = "${config.home.homeDirectory}/Drives/network/music";
        extraConfig = ''
audio_output {
        type            "pipewire"
        name            "PipeWire Sound Server"
}
 audio_output {
    type                    "fifo"
    name                    "my_fifo"
    path                    "/tmp/mpd.fifo"
    format                  "44100:16:2"
 }
        '';
    };
}
