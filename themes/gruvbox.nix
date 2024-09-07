{ dir }:
{
    themeName = "gruvbox-material-dark-medium";
    wallpaper = ../non-nix/wallpapers/dopesmoker_gruvbox.png;
    override = null;

    # Override stylix theme of btop.
    overrideBtop = true;
    btopTheme = "gruvbox_dark_v2";

    # Hyprland and ags;
    opacity = 1.0;
    rounding = 25;
    shadow = true;
    bordersPlusPlus = true;
    ags = {
        theme = {
            palette = {
                widget = "#45403d";
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
