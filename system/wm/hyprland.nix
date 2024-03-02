{ inputs, config, pkgs, ... }:

{
    imports = [
        ./common/wayland.nix
        ./common/fonts.nix
    ];

    programs = {
        hyprland = {
            enable = true;
            xwayland.enable = true;
            package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        };
    };
}
