{ inputs, config, pkgs, ... }:
{
    services.xserver = {
        enable = true;
        displayManager.defaultSession = "xfce";
        desktopManager = {
            xfce.enable = true;
        };
    };
}
