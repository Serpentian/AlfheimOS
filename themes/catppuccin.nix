{ pkgs, ...}:
{
    themeName = "catppuccin-mocha";
    wallpaper = ../non-nix/wallpapers/evening-sky.png;
    # Stylix palette override.
    override = {
        base00 = "11111b";
    };

    # Override stylix theme of btop.
    btopTheme = "catppuccin";

    # Hyprland and ags.
    opacity = 0.8;
    rounding = 25;
    shadow = false;
    bordersPlusPlus = false;

    # Override default settings in ags.
    shell = "ags";
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

    font = "FiraCode Nerd Font"; # Selected font
    fontPkg = (pkgs.nerd-fonts.fira-code);
    fontSize = 13; # Font size

    icons = "Papirus";
    iconsPkg = pkgs.papirus-icon-theme;
}
