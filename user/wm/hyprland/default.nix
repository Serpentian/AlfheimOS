{ inputs, config, lib, settings, pkgs, ... }:

{
    imports = [
        ./shells/${settings.themeDetails.shell}
        ./env.nix
        ./binds.nix
        ./scripts.nix
        ./rules.nix
        ./settings.nix
        ./plugins.nix
        ./hyprlock.nix
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
