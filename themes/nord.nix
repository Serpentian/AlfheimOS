{ dir }:
{
    themeName = "nord";
    wallpaper = ../non-nix/wallpapers/nord.jpg;
    override = null;

    # Override stylix theme of btop.
    overrideBtop = false;

    # Hyprland and ags;
    opacity = 1.0;
    rounding = 0;
    shadow = true;
    bordersPlusPlus = true;
    ags = {
        theme = {
            border = {
                width = 1;
                opacity = 70;
            };
        };
        bar = {
            flatButtons = true;
        };
    };
}
