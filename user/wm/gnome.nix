{ inputs, config, pkgs, ... }:

{
    imports = [
        ./gnome/extensions.nix
        ./gnome/autostart.nix
        ./gnome/settings.nix
    ];
}
