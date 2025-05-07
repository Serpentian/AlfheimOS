{ pkgs, lib, settings, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../../system/hardware/sound.nix
        ../../system/hardware/bluetooth.nix
        ../../system/hardware/desktop/graphic.nix
        ../../system/hardware/desktop/mouse.nix
        # ../../system/hardware/desktop/printing.nix
        ../../system/hardware/desktop/boot.nix
        ../../system/hardware/desktop/nfs.nix
        ../../system/security/desktop/firewall.nix
        ../../system/security/virtualization/general.nix
        ../../system/security/virtualization/nemu
        ../../system/apps/thunar.nix
        # ../../system/apps/ollama.nix
        ../../system/gaming/steam.nix
        ../../system/gaming/lutris.nix
        # ../../system/gaming/retroarch.nix
        ../../system/gaming/aagl.nix
        ../../system/gaming/nethack.nix
        # ../../system/gaming/minecraft.nix
        ../../system/security/vpn/xray.nix
        (./. + "../../../system/wm"+("/" + builtins.elemAt settings.wm 0)+".nix")
        # (./. + "../../../system/wm"+("/" + builtins.elemAt settings.wm 1)+".nix")
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;

    nixpkgs.overlays = import ../../lib/overlays.nix; # Add packages from the pkgs dir
    nixpkgs.config.allowUnfree = true; # Sorry, Stallman(
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Netorking
    networking.hostName = settings.hostname;
    networking.networkmanager.enable = true;
    networking.networkmanager.dns = "dnsmasq";
    networking.extraHosts = ''
        127.0.0.1 serpentian.home
    '';

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
        extraGroups = [ "wheel" "gamemode" ];
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
        nix-index
        pciutils
        go-mtpfs
        ntfs3g
        inetutils
        lsof
        wget
        git
        vim
    ];

    # A lot of mpris packages require it.
    services.gvfs.enable = true;

    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?
}

