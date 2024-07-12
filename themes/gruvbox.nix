{ dir }:
{
    themeName = "gruvbox-material-dark-medium";
    wallpaper = ../non-nix/wallpapers/dopesmoker_gruvbox.png;
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
