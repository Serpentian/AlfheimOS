{ settings, ...}:
{
    # Personal is essentially work system + games.
    # No games yet, hyprland performance is poor in games.
    imports = [
        ../../system/hardware-configuration.nix
        ../work/configuration.nix

        ../../system/gaming/steam.nix
        (./. + "../../../system/wm"+("/"+settings.gamingWm)+".nix")
    ];
}
