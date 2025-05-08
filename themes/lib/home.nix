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

    home.packages = with pkgs; [
        details.fontPkg
    ];

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
