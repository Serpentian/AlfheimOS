{ config, pkgs, settings, ... }:

{
    fonts.packages = with pkgs; [
        settings.fontPkg
    ];
}
