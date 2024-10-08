{ pkgs, config, inputs, settings, ... }:
{
    imports = [
        inputs.sops-nix.nixosModules.sops
    ];

    sops.age.keyFile = "/home/${settings.username}/.config/sops/age/keys.txt";
    sops.defaultSopsFile = ./secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.secrets.subsonic = { owner = settings.username; };
    sops.secrets.lastFm = { owner = settings.username; };
}
