{ inputs, config, pkgs, ... }:

{
    imports = [
        ./common/wayland.nix
        ./common/fonts.nix
    ];

    services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
    services.xserver.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = (with pkgs; [
        gnome-photos
        gnome-tour
        gedit
    ]) ++ (with pkgs.gnome; [
        cheese # webcam tool
        gnome-music
        epiphany # web browser
        geary # email reader
        evince # document viewer
        gnome-characters
        totem # video player
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
    ]);

    nixpkgs.overlays = [
        (final: prev: {
        gnome = prev.gnome.overrideScope' (gnomeFinal: gnomePrev: {
            mutter = gnomePrev.mutter.overrideAttrs ( old: {
                src = pkgs.fetchgit {
                    url = "https://gitlab.gnome.org/vanvugt/mutter.git";
                    # GNOME 45: triple-buffering-v4-45
                    rev = "0b896518b2028d9c4d6ea44806d093fd33793689";
                    sha256 = "sha256-mzNy5GPlB2qkI2KEAErJQzO//uo8yO0kPQUwvGDwR4w=";
                };
            } );
        });
        })
    ];
}
