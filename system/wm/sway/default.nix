{...}:
{
    security.polkit.enable = true;
    programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        extraPackages = [];
    };

    xdg.portal = {
        enable = true;
        wlr.enable = true;
    };
}
