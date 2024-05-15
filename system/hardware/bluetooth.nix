{ config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        bluez
        bluez-tools
    ];

    hardware.bluetooth = {
        enable = true;
        package = pkgs.bluez;
    };
}
