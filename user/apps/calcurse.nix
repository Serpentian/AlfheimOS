{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        calcurse
    ];
}
