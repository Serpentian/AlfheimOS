{pkgs, ...}:
{
    themeName = "rose-pine";
    avatar = ../non-nix/avatars/butterfly.png;
    wallpaper = {
        left = ../non-nix/wallpapers/butterfly-left.png;
        center = ../non-nix/wallpapers/butterfly-girl.png;
        right = ../non-nix/wallpapers/butterfly-right.png;
    };
    override = {
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

    font = "IosevkaTerm NF"; # Selected font
    fontPkg = (pkgs.nerd-fonts.iosevka-term);
    fontSize = 16; # Font size

    icons = "Papirus";
    iconsPkg = pkgs.papirus-icon-theme;
}
