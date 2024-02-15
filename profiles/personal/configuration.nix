{ ... }:
{
    # Personal is essentially work system + games.
    # No games yet, hyprland performance is poor in games.
    imports = [
        ../work/configuration.nix
        ../../system/hardware-configuration.nix
        ../../system/gaming/steam.nix
    ];
}
