{ dir }:
{
    themeName = "nord";
    wallpaper = ../non-nix/wallpapers/nord.jpg;
    override = null;

    # Override stylix theme of btop.
    overrideBtop = false;

    # Hyprland and ags;
    opacity = 0.9;
    rounding = 25;
    shadow = true;
    bordersPlusPlus = false;
    ags = {
        theme = {
            palette = {
                widget = "#434c5e";
            };
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
