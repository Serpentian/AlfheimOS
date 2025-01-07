{ pkgs, lib, settings, config, ... }: let
    details = settings.themeDetails;
in {
    stylix = {
        enable = true;
        polarity = "dark";
        image = details.wallpaper;
        base16Scheme = lib.mkIf (details.themeName != null)
            "${pkgs.base16-schemes}/share/themes/${details.themeName}.yaml";
        override = lib.mkIf (details.override != null) details.override;
        opacity = {
            terminal = details.opacity;
            applications = details.opacity;
            desktop = details.opacity;
            popups = details.opacity;
        };

        cursor = {
            size = 32;
            name = "phinger-cursors-light";
            package = pkgs.phinger-cursors;
        };

        targets.nixvim.enable =
            lib.mkIf (settings.themeDetails.themeName != null) false;

        targets.btop.enable =
            lib.mkIf (settings.themeDetails.btopTheme != null) false;
        targets.hyprlock.enable = false;
    };
}
