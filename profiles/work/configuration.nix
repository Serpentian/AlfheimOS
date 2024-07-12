{ pkgs, lib, settings, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../../themes/stylix.nix
        ../../system/hardware/sound.nix
        ../../system/hardware/bluetooth.nix
        ../../system/hardware/desktop/boot.nix
        ../../system/security/laptop/firewall.nix
        ../../system/security/virtualization/general.nix
        ../../system/security/virtualization/nemu
        ../../system/apps/cron.nix
        # ../../system/apps/tlp.nix
        (./. + "../../../system/wm"+("/" + builtins.elemAt settings.wm 0)+".nix")
        (./. + "../../../system/wm"+("/" + builtins.elemAt settings.wm 1)+".nix")
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    nixpkgs.overlays = import ../../lib/overlays.nix; # Add packages from the pkgs dir
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
    services.upower.enable = true;

    services.xserver.videoDrivers = [ "displaylink" "modesetting" ];

    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.11"; # Did you read the comment?
}

