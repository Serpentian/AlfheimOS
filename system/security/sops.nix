{ pkgs, config, inputs, settings, ... }:
{
    environment.systemPackages = with pkgs; [ sops ];
    imports = [ inputs.sops-nix.nixosModules.sops ];

    sops.age.keyFile = "/home/${settings.username}/.config/sops/age/keys.txt";
    sops.defaultSopsFile = ./secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.secrets."subsonic/password" = { owner = settings.username; };
    sops.secrets."subsonic/uri" = { owner = settings.username; };
    sops.secrets.lastFm = { owner = settings.username; };
}
