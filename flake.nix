{
    description = "Alfheim NixOs";

    outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
        settings = {
            system = "x86_64-linux";
            hostname = "alfheim"; # Hostname
            username = "serpentian"; # Ssername
            profile = "personal"; # Select from profiles directory
            timezone = "Europe/Moscow"; # Select timezone
            locale = "en_US.UTF-8"; # Select locale
            name = "Nikita Zheleztsov"; # Name (git config)
            email = "n.zheleztsov@proton.me"; # Email (git config)
            dotfilesDir = ".dotfiles"; # Absolute path of the local repo
            theme = "catppuccin-mocha"; # Selected theme from themes directory (./themes/)
            wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/

            font = "Hack Nerd Font"; # Selected font
            fontPkg = (pkgs.nerdfonts.override { fonts = [ "Hack"]; }); # Selected font
            fontSize = 12; # Font size

            icons = "Papirus";
            iconsPkg = pkgs.papirus-icon-theme;

            editor = "nvim"; # Default editor
            browser = "firefox"; # Default browser; must select one from ./user/app/browser/
            term = "kitty"; # Default terminal command

            enableVPN = true; # Whether to include VPN configuration
        };

        pkgs = import nixpkgs {system = settings.system;};
    in {
        # NixOS configuration entrypoint.
        # 'nixos-rebuild switch --flake .#hostname
        nixosConfigurations = {
            ${settings.hostname} = nixpkgs.lib.nixosSystem {
                modules = [ (./. + "/profiles" + ("/" + settings.profile) + "/configuration.nix") ];
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
                modules = [ (./. + "/profiles" + ("/" + settings.profile) + "/home.nix") ];
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
        hyprland.url = "github:hyprwm/Hyprland";
    };
}
