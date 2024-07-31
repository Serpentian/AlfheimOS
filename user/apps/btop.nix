{ config, settings, pkgs, lib, ... }:
{
    programs.btop = {
        enable = true;
        package = pkgs.btop.override {rocmSupport = true; };
        settings = {
            theme_background = false;
            vim_keys = true;
            update_ms = 500;
        };
    };
}
