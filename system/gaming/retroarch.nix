{ config, pkgs, ... }:

{
    hardware.xpadneo.enable = true;
    environment.systemPackages = with pkgs; [
        retroarchFull
        retroarch-assets
        retroarch-joypad-autoconfig
    ];
}
