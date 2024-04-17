{ config, pkgs, ... }:

{
    hardware.sane.enable = false;
    services.printing = {
        enable = true;
        drivers = with pkgs; [ samsung-unified-linux-driver ];
    };
}
