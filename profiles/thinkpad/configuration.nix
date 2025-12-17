{ pkgs, lib, settings, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../../system/hardware/sound.nix
        ../../system/hardware/bluetooth.nix
        ../../system/hardware/thinkpad/boot.nix
        ../../system/security/laptop/firewall.nix
        ../../system/hardware/laptop/battery.nix
        ../../system/virtualization
        ../../system/gaming/nethack.nix
        ../../themes/lib/common.nix
    ] ++ (map (wm: ../../system/wm/${wm}.nix) settings.wms);

    boot.kernelPackages = pkgs.linuxPackages_latest;

    nixpkgs.overlays = import ../../pkgs/lib/overlays.nix;
    nixpkgs.config.allowUnfree = true; # Sorry, Stallman(
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Netorking
    networking.hostName = settings.hostname;
    networking.networkmanager.enable = true;

    # Timezone
    time.timeZone = settings.timezone;
    services.chrony.enable = true;

    # Locale.
    i18n.defaultLocale = settings.locale;
    i18n.extraLocaleSettings = {
        LC_ALL = settings.locale;
    };

    programs.${settings.shell}.enable = true;

    # Users.
    users.users.${settings.username} = {
        isNormalUser = true;
        shell = pkgs.${settings.shell};
        description = settings.username;
        extraGroups = [ "wheel" ];
    };

    # See https://nix.dev/permalink/stub-ld.
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        stdenv.cc.cc
    ];

    # List of globally installed packages.
    environment.systemPackages = with pkgs; [
        home-manager
        nix-index
        pciutils
        go-mtpfs
        lsof
        wget
        git
        vim
    ];

    # A lot of mpris packages require it.
    services.gvfs.enable = true;
    services.upower.enable = true;

    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?
}

