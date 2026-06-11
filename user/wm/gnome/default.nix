{ inputs, config, pkgs, ... }:

{
    imports = [
        ./extensions.nix
        ./autostart.nix
        ./settings.nix
    ];
}
