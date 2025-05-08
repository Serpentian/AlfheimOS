{pkgs, ...}:
{
    themeName = "nord";
    wallpaper = ../non-nix/wallpapers/violet-nord.png;
    override = {
        base02 = "#445060";
        base05 = "#fffcf0";
    };

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

    font = "FiraCode Nerd Font"; # Selected font
    fontPkg = (pkgs.nerd-fonts.fira-code);
    fontSize = 13; # Font size

    icons = "Papirus";
    iconsPkg = pkgs.papirus-icon-theme;
}
