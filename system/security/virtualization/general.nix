{ config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        docker-compose
        distrobox
    ];

    # Enable docker daemon. Rootless docker doesn't properly work
    # with distrobox. Let's use podman for that)
    virtualisation.docker.enable = true;
    virtualisation.podman.enable = true;
    virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
}

