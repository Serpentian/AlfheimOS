{pkgs, ... }: let
    shell = "noctalia";
in {
    _module.args.swayShellDetails =
        import (../. + "/shells/${shell}/details.nix") {};

    imports = [
        ./binds.nix
        ./settings.nix
        ./scripts.nix
        ../shells/${shell}
    ];

    wayland.windowManager.sway = {
        enable = true;
        wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    };

    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-wlr
        ];
        config.sway = {
            default = ["gtk"];
            "org.freedesktop.impl.portal.ScreenCast" = ["wlr"];
            "org.freedesktop.impl.portal.Screenshot" = ["wlr"];
            # Let applications use Wayland's idle-inhibit protocol directly.
            "org.freedesktop.impl.portal.Inhibit" = ["none"];
        };
    };
}
