{ ... }: let
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
    };
}
