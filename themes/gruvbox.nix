{pkgs, ...}:
{
    themeName = "gruvbox-material-dark-medium";
    wallpaper = ../non-nix/wallpapers/nature-gruvbox.jpg;
    override = null;

    # Override stylix theme of btop.
    btopTheme = "gruvbox_dark_v2";
    shell = "ags";

    # Hyprland and ags;
    opacity = 1.0;
    rounding = 25;
    shadow = true;
    bordersPlusPlus = false;
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

    font = "FiraCode Nerd Font"; # Selected font
    fontPkg = (pkgs.nerd-fonts.fira-code);
    fontSize = 13; # Font size

    icons = "Papirus";
    iconsPkg = pkgs.papirus-icon-theme;
}
