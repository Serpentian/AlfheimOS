{
    description = "Alfheim NixOs";

    outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
        settings = import (./. + "/settings.nix") {inherit pkgs;};
        pkgs = import nixpkgs {system = settings.system;};
    in {
        # NixOS configuration entrypoint.
        # 'nixos-rebuild switch --flake .#hostname
        nixosConfigurations = {
            ${settings.hostname} = nixpkgs.lib.nixosSystem {
                modules = [
                    (./. + "/profiles" + ("/" + settings.profile) + "/configuration.nix")
                    inputs.catppuccin.nixosModules.catppuccin
                ];
                specialArgs = {
                    inherit inputs;
                    inherit settings;
                };
            };
        };

        # Standalone home-manager configuration entrypoint.
        # 'home-manager switch --flake .#username
        homeConfigurations = {
            ${settings.username} = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${settings.system};
                modules = [
                    (./. + "/profiles" + ("/" + settings.profile) + "/home.nix")
                    inputs.catppuccin.homeManagerModules.catppuccin
                ];
                extraSpecialArgs = {
                    inherit inputs;
                    inherit settings;
                };
            };
        };
    };

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        ags.url = "github:Aylur/ags";
        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
        aagl.url = "github:ezKEa/aagl-gtk-on-nix";
        aagl.inputs.nixpkgs.follows = "nixpkgs";
        superfile.url = "github:yorukot/superfile";
        catppuccin.url = "github:catppuccin/nix";
    };
}
