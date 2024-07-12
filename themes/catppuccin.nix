{ dir }:
{
    themeName = "catppuccin-mocha";
    wallpaper = ../non-nix/wallpapers/evening-sky.png;
    # Stylix palette override.
    override = {
        base00 = "11111b";
    };

    # Hyprland and ags.
    opacity = 0.8; # affects theme.blur in ags.
    rounding = 25; # affects theme.rounding in ags.
    shadow = false; # affects theme.shadows in ags.
    bordersPlusPlus = false;

    # Override default settings in ags.
    ags = {
        theme = {
            palette = {
                widget = "#25253a";
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
