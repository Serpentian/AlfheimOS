{pkgs, ...}:
{
    themeName = "everforest-dark-hard";
    wallpaper = ../non-nix/wallpapers/frieren-everforest.jpg;
    override = null;

    # Override stylix theme of btop.
    btopTheme = null;

    # Hyprland and ags;
    shell = "ags";
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

    font = "FiraCode Nerd Font"; # Selected font
    fontPkg = (pkgs.nerd-fonts.fira-code);
    fontSize = 13; # Font size

    icons = "Papirus";
    iconsPkg = pkgs.papirus-icon-theme;
}
