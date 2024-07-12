{ dir }:
{
    themeName = "everforest-dark-hard";
    wallpaper = ../non-nix/wallpapers/frieren-everforest.jpg;
    override = null;

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
