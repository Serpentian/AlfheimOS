{ inputs, config, pkgs, ... }:

{
    imports = [
        ./hyprland/notification.nix
        ./hyprland/ags.nix
        ./hyprland/launcher.nix
        ./hyprland/bar.nix
        ./hyprland/env.nix
        ./hyprland/binds.nix
        ./hyprland/scripts.nix
        ./hyprland/rules.nix
        ./hyprland/settings.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        systemd.enable = true;
    };
}
