{ pkgs, settings, lib, ... }:
{
    networking.firewall = {
        enable = true;
    };
}
