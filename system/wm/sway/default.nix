{pkgs, ...}: let
    shell = "noctalia";
in {
    imports = [
        ../common/wayland.nix
        ../shells/${shell}.nix
    ];

    security.polkit.enable = true;
    programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        extraPackages = [];
    };

    xdg.portal = {
        enable = true;
        wlr.enable = true;
        extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };
}
