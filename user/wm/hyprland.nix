{ inputs, config, lib, settings, pkgs, ... }:

{
    imports = [
        ./hyprland/ags.nix
        ./hyprland/env.nix
        ./hyprland/binds.nix
        ./hyprland/scripts.nix
        ./hyprland/rules.nix
        ./hyprland/settings.nix
        ./hyprland/plugins.nix
        ./hyprland/hyprlock.nix
    ];

    home.packages = with pkgs; [
        hyprcursor
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        systemd.enable = true;
        plugins = [
            pkgs.hyprlandPlugins.hyprexpo
            pkgs.hyprlandPlugins.hypr-dynamic-cursors
        ] ++ lib.optional (settings.themeDetails.bordersPlusPlus)
            pkgs.hyprlandPlugins.borders-plus-plus;
    };
}
