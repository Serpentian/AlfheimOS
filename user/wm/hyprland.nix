{ inputs, config, lib, settings, pkgs, ... }:

{
    imports = [
        ./hyprland/shells/${settings.themeDetails.shell}.nix
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
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        systemd.enable = true;
        plugins = [
            inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
        ] ++ lib.optional (settings.themeDetails.bordersPlusPlus)
            inputs.hyprland-plugins.packages.${pkgs.system}.borders-plus-plus;
    };
}
