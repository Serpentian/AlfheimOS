{ config, pkgs, ...}:
{
    imports = [
        ./ncmpcpp.nix
    ];

    home.packages = with pkgs; [
        mpc-cli
    ];

    services.mopidy = {
        enable = true;
        extensionPackages = with pkgs; [
            mopidy-mpd
            mopidy-mpris
            mopidy-subidy
            mopidy-scrobbler
        ];
        settings = {
            subidy = {
                url = (builtins.readFile "/run/secrets/subsonic/uri");
                username = "serpentian";
                password = (builtins.readFile "/run/secrets/subsonic/password");
            };
            scrobbler = {
                username = "serpentian";
                password = (builtins.readFile "/run/secrets/lastFm");
            };
        };
    };
}
