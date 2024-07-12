{ inputs, config, pkgs, ... }:

{
    dconf.settings = {
        "/org/gnome/desktop/interface" = {
            # cursor-theme = "Catppuccin-Mocha-Lavender-Cursors";
            # document-font-name = "JetBrains Mono 12";
            # monospace-font-name = "JetBrains Mono 12";
            # titlebar-font = "JetBrains Mono 12";
        };
        "/org/gnome/mutter" = {
            center-new-windows = true;
        };
        "/org/gnome/mutter" = {
            experimental-features = "['scale-monitor-framebuffer']";
        };
    };
}
