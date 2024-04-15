{ pkgs, lib, settings, ... }:
{
    imports = [
        ../../system/hardware-configuration.nix
        ../../system/hardware/graphic.nix
        ../../system/hardware/sound.nix
        ../../system/hardware/mouse.nix
        ../../system/hardware/boot.nix
        ../../system/hardware/printing.nix
        ../../system/security/firewall.nix
        ../../system/security/virtualization/docker.nix
        ../../system/security/virtualization/nemu
        ../../system/apps/cron.nix
        ../../system/gaming/steam.nix
        ../../system/gaming/lutris.nix
        (if settings.enableVPN then ../../system/security/vpn.nix else null)
        (./. + "../../../system/wm"+("/" + builtins.elemAt settings.wm 0)+".nix")
    ];

    boot.kernelPackages = pkgs.linuxPackages_zen;

    nixpkgs.overlays = import ../../lib/overlays.nix; # Add packages from the pkgs dir
    nixpkgs.config.allowUnfree = true; # Sorry, Stallman(
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Netorking
    networking.hostName = settings.hostname;
    networking.dhcpcd.enable = true;

    # Timezone
    time.timeZone = settings.timezone;
    services.chrony.enable = true;

    # Locale.
    i18n.defaultLocale = settings.locale;
    i18n.extraLocaleSettings = {
        LC_ALL = settings.locale;
    };

    # Users.
    users.users.${settings.username} = {
        isNormalUser = true;
        description = settings.username;
        extraGroups = [ "wheel" ];
    };

    # Use zsh. TODO: option to flake.nix, several shells.
    environment.shells = with pkgs; [ zsh ];
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    # See https://nix.dev/permalink/stub-ld.
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        stdenv.cc.cc
    ];

    # List of globally installed packages.
    environment.systemPackages = with pkgs; [
        home-manager
        pciutils
        go-mtpfs
        lsof
        wget
        git
        vim
    ];

    # A lot of mpris packages require it.
    services.gvfs.enable = true;

    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.11"; # Did you read the comment?
}

