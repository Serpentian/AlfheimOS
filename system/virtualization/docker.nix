{ config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        docker-compose
    ];

    # Enable docker daemon.
    virtualisation.docker.enable = true;
}

