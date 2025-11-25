{ pkgs, lib, settings, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../../system/hardware/sound.nix
        ../../system/hardware/bluetooth.nix
        ../../system/hardware/desktop/graphic.nix
        ../../system/hardware/desktop/mouse.nix
        ../../system/hardware/desktop/boot.nix
        ../../system/hardware/desktop/nfs.nix
        ../../system/security/desktop/firewall.nix
        ../../system/virtualization
        ../../system/security/vpn/xray.nix
        ../../system/security/sops.nix
        ../../system/apps/thunar.nix
        # ../../system/apps/open-webui.nix
        ../../system/apps/guix.nix
        ../../system/apps/ollama.nix
        ../../system/gaming/steam.nix
        ../../system/gaming/nethack.nix
        ../../themes/lib/common.nix
    ] ++ (map (wm: ../../system/wm/${wm}.nix) settings.wms);

    boot.kernelPackages = pkgs.linuxPackages_latest;

    nixpkgs.overlays = import ../../lib/overlays.nix;
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

    programs.${settings.shell}.enable = true;

    # Users.
    nix.settings.trusted-users = [ "root" settings.username ];
    users.users.${settings.username} = {
        isNormalUser = true;
        shell = pkgs.${settings.shell};
        description = settings.username;
        extraGroups = [ "wheel" "gamemode" ];
    };

    # See https://nix.dev/permalink/stub-ld.
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        stdenv.cc.cc
    ];

    # List of globally installed packages.
    environment.systemPackages = with pkgs; [
        usbutils
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

    fonts.packages = [ settings.themeDetails.fontPkg ];

    # A lot of mpris packages require it.
    services.gvfs.enable = true;

    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?
}

