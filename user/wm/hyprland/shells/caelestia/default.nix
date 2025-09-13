{ inputs, pkgs, settings, lib, config, ... }: let
in {
    home.packages = with pkgs; [
        inputs.caelestia.packages.${pkgs.system}.default
    ];
}
