{pkgs, settings, lib, ...}: let
    details = settings.themeDetails;
in {
    gtk = {
        enable = true;
        iconTheme = {
            name = details.icons;
            package = details.iconsPkg;
        };
    };

    stylix = {
        targets.nixvim.enable =
            lib.mkIf (settings.themeDetails.themeName != null) false;
        targets.tmux.enable = false;
        targets.hyprlock.enable = false;
        targets.hyprland.enable = false;
        targets.btop.enable =
            lib.mkIf (settings.themeDetails.btopTheme != null) false;
    };
}
