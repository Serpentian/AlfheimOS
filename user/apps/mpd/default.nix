{ config, pkgs, ...}:
{
    imports = [
        ./ncmpcpp.nix
    ];

    home.packages = with pkgs; [
        mpc-cli
    ];

    services.mpd = {
        enable = true;
        musicDirectory = "${config.home.homeDirectory}/Drives/hdd/Music";
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
