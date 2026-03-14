{ config, pkgs, settings, ...}:

{
    imports = [
        ./spice.nix
        # ./nemu
    ];

    environment.systemPackages = with pkgs; [
        docker-compose
        distrobox
        libvirt
        qemu

        # support both 32- and 64-bit applications
        wineWow64Packages.stable

        # support 32-bit only (read above!)
        wine

        # support 64-bit only
        (wine.override { wineBuild = "wine64"; })

        # support 64-bit only
        wine64

        # wine-staging (version with experimental features)
        wineWow64Packages.staging

        # winetricks (all versions)
        winetricks

        # native wayland support (unstable)
        wineWow64Packages.waylandFull
    ];

    # Enable docker daemon. Rootless docker doesn't properly work
    # with distrobox. Let's use podman for that)
    virtualisation.docker.enable = true;
    virtualisation.podman.enable = true;
    virtualisation.podman.defaultNetwork.settings.dns_enabled = true;

    users.users.${settings.username} = {
        extraGroups = [ "kvm" ];
    };
}

