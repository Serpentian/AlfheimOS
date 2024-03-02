{ inputs, config, pkgs, ... }:

{
    home.packages = with pkgs; [
        gnome.gnome-tweaks
        gnomeExtensions.appindicator
        gnomeExtensions.blur-my-shell
    ];

}
