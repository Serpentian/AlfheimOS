{
    description = "Alfheim NixOs";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        ags.url = "github:Aylur/ags";
        hyprland.url = "github:hyprwm/Hyprland";
    };

    outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
        inherit (self) outputs;
    in {
        # NixOS configuration entrypoint.
        # 'nixos-rebuild switch --flake .#your-hostname'
        nixosConfigurations = {
            alfheim = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit inputs outputs;};
                modules = [./nixos/configuration.nix];
            };
        };

        # Standalone home-manager configuration entrypoint.
        # 'home-manager switch --flake .#your-username@your-hostname'
        homeConfigurations = {
            "serpentian" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.x86_64-linux;
                extraSpecialArgs = {inherit inputs outputs;};
                modules = [./home-manager/home.nix];
            };
        };
    };
}
