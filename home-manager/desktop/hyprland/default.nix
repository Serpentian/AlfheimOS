{ inputs, config, pkgs, ... }:

{
    imports = [
        ./notification.nix
        ./ags.nix
        ./launcher.nix
        ./bar.nix
        ./env.nix
        ./binds.nix
        ./scripts.nix
        ./rules.nix
        ./settings.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        systemd.enable = true;
    };
}
