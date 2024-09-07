{ config, settings, pkgs, lib, ... }: let
    details = settings.themeDetails;
in {
    imports = lib.optionals (details.overrideBtop != false) [
        (./. + "/${settings.theme}.nix")
    ];

    programs.btop = {
        enable = true;
        package = pkgs.btop.override {rocmSupport = true; };
        settings = {
            color_theme = lib.mkIf (details.btopTheme != null)
                "${details.btopTheme}.theme";
            theme_background = false;
            vim_keys = true;
            update_ms = 500;
        };
    };
}
