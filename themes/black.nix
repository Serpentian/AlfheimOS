{ dir }:
{
    themeName = "black-metal-immortal";
    wallpaper = ../non-nix/wallpapers/black.png;
    override = null;

    # Override stylix theme of btop.
    btopTheme = "nord";

    # Hyprland and ags;
    opacity = 1.0;
    rounding = 25;
    shadow = true;
    bordersPlusPlus = false;
    ags = {
        theme = {
            palette = {};
            border = {
                width = 1;
                opacity = 96;
            };
        };
        bar = {
            curved = true;
        };
        widget = {
            opacity = 0;
        };
    };
}
