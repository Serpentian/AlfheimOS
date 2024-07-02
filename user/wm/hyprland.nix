{ inputs, config, pkgs, ... }:

{
    imports = [
        ./hyprland/ags.nix
        ./hyprland/env.nix
        ./hyprland/binds.nix
        ./hyprland/scripts.nix
        ./hyprland/rules.nix
        ./hyprland/settings.nix
        ./hyprland/plugins.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        systemd.enable = true;
        plugins = [
            # inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
            pkgs.hyprlandPlugins.hyprexpo
        ];
    };
}
