{ settings, pkgs, ... }:

{
    services.open-webui = rec {
        enable = true;
        port = 11111;
    };
}
