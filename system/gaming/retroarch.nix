{ config, pkgs, ... }:

{
    hardware.xpadneo.enable = true;
    environment.systemPackages = with pkgs; [
        retroarch
        retroarch-assets
        retroarch-joypad-autoconfig
    ];
}
