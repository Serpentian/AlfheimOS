{pkgs, ...}:
{
    themeName = "rose-pine";
    wallpaper = ../non-nix/wallpapers/butterfly-girl.png;
    override = {
        # base00 = "191628";
        # base00 = "161325";
        base00 = "05000f";
    };

    # Override stylix theme of btop.
    btopTheme = "gruvbox_dark_v2";
    ags = {};

    # Hyprland and ags;
    opacity = 1.0;
    rounding = 0;
    shadow = true;
    bordersPlusPlus = false;

    font = "Iosevka Nerd Font"; # Selected font
    fontPkg = (pkgs.nerd-fonts.iosevka-term);
    fontSize = 14; # Font size

    icons = "Papirus";
    iconsPkg = pkgs.papirus-icon-theme;
}
