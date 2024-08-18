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
            border = {
                width = 1;
                opacity = 96;
            };
        };
        bar = {
            curved = true;
        };
    };
}
