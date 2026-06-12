{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        wayland
        wl-clipboard
        brightnessctl
    ];

    # Configure xwayland
    services.xserver = {
        enable = true;
        xkb = {
            variant = "";
            layout = "us,ru";
            options = "grp:win_space_toggle";
        };
        displayManager.startx = {
            enable = true;
        };
    };
}
