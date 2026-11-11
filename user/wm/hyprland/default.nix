{ inputs, config, lib, settings, pkgs, ... }: let
    shell = "noctalia";
in {
    _module.args.hyprlandShellDetails =
        import (../. + "/shells/${shell}/details.nix") {};
    imports = [
        ./env.nix
        ./binds.nix
        ./scripts.nix
        ./rules.nix
        ./plugins.nix
        ./hyprlock.nix
        ../shells/${shell}
        ./settings.nix
    ];

    home.packages = with pkgs; [
        hyprcursor
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        package = pkgs.hyprland;
        systemd.enable = true;
        plugins = [
            # inputs.hypr-dynamic-cursors.packages.${pkgs.stdenv.hostPlatform.system}.hypr-dynamic-cursors
            # pkgs.hyprlandPlugins.hypr-dynamic-cursors
        ] ++ lib.optional (settings.themeDetails.bordersPlusPlus)
            # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.borders-plus-plus;
            pkgs.hyprlandPlugins.borders-plus-plus;
    };

    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        config = {
            hyprland.default = ["hyprland"];
        };
    };
}
