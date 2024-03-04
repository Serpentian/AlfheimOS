{ inputs, config, pkgs, ... }:

{
    home.packages = with pkgs; [
        gnome.gnome-tweaks
        gnomeExtensions.appindicator
        gnomeExtensions.blur-my-shell
    ];

    dconf.settings = {
        "org/gnome/shell" = {
            disable-user-extensions = false;
            enabled-extensions = [
                "blur-my-shell@aunetx"
                "appindicatorsupport@rgcjonas.gmail.com"
                "flypie@schneegans.github.com" # Must be downloaded manually!
                "user-theme@gnome-shell-extensions.gcampax.github.com"
                "useless-gaps@pimsnel.com" # Waiting to be updated at Nix. Manually.
            ];
        };

        "org/gnome/shell/extensions/user-theme" = {
            name = "Catppuccin-Mocha-Standard-Lavender-Dark";
        };
        "/org/gnome/shell/extensions/flypie" = {
            font = "JetBrains Mono 12";
            label-font = "JetBrains Mono 10";
        };
        "/org/gnome/shell/extensions/blur-my-shell/overview" = {
            style-components = 3;
        };
    };
}

