{ dir }:
{
    themeName = "nord";
    wallpaper = ../non-nix/wallpapers/violet-nord.png;
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
