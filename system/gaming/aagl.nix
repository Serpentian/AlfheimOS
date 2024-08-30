{ inputs, pkgs, ... }:

{
    imports = [ inputs.aagl.nixosModules.default ];
    nix.settings = inputs.aagl.nixConfig; # Set up Cachix

    programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
    # programs.anime-games-launcher.enable = true;
    # programs.anime-borb-launcher.enable = true;
    programs.honkers-railway-launcher.enable = true;
    # programs.honkers-launcher.enable = true;
}
