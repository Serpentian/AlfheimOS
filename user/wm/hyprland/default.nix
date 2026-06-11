{ inputs, config, lib, settings, pkgs, ... }: let
    shell = "ags";
in {
    _module.args.shellDetails =
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
        # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        package = pkgs.hyprland;
        systemd.enable = true;
        plugins = [
            # inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
            # pkgs.hyprlandPlugins.hypr-dynamic-cursors
        ] ++ lib.optional (settings.themeDetails.bordersPlusPlus)
            # inputs.hyprland-plugins.packages.${pkgs.system}.borders-plus-plus;
            pkgs.hyprlandPlugins.borders-plus-plus;
    };
}
