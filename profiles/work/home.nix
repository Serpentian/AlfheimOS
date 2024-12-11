{ config, pkgs, settings, inputs, ...}:
{
    imports = [
        (./. + "../../../user/wm"+("/" + builtins.elemAt settings.wm 0)+".nix")
        (./. + "../../../user/wm"+("/" + builtins.elemAt settings.wm 1)+".nix")
        # ../../user/apps/w3m.nix
        ../../themes/stylix.nix
        ../../user/apps/spotify.nix
        ../../user/apps/kitty.nix
        ../../user/apps/git.nix
        ../../user/apps/btop.nix
        ../../user/apps/superfile.nix
        ../../user/apps/zathura.nix
        ../../user/apps/nemu.nix
        ../../user/apps/cava.nix
        ../../user/apps/khal.nix
        # ../../user/apps/qutebrowser.nix
        ../../user/apps/ssh.nix
        ../../user/apps/neofetch
        ../../user/apps/neovim
        ../../user/shell/zsh.nix
        ../../user/gaming/nethack.nix
    ];

    stylix.targets.hyprland.enable = false;

    home = {
        username = settings.username;
        homeDirectory = "/home/${settings.username}";
    };

    # Add packages from the pkgs dir
    nixpkgs.overlays = import ../../lib/overlays.nix;
    nixpkgs.config.allowUnfree = true; # Sorry, Stallman(
    home.packages = with pkgs; [
        sway-contrib.grimshot
        libreoffice-fresh
        yubikey-manager
        obs-studio
        tty-clock
        teleport
        rtorrent
        swayimg
        openvpn
        drawio
        gimp
        mpv

        # Sometimes needed for work.
        chromium

        # These packages are compulsury.
        # settings.editorPkg
        settings.browserPkg
        settings.termPkg
    ];

    xdg.enable = true;
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
        music = "${config.home.homeDirectory}/Media/Music";
        videos = "${config.home.homeDirectory}/Media/Videos";
        pictures = "${config.home.homeDirectory}/Media/Pictures";
        download = "${config.home.homeDirectory}/Downloads";
        documents = "${config.home.homeDirectory}/Documents";
        templates = null;
        desktop = null;
        publicShare = null;
        extraConfig = {
            XDG_DOTFILES_DIR = "${settings.dotfilesDir}";
            XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
        };
    };

    home.sessionVariables = {
        EDITOR = settings.editor;
        TERM = settings.term;
        BROWSER = settings.browser;
    };

    services.kdeconnect.enable = true;
    programs.home-manager.enable = true;

    gtk = {
        enable = true;
        iconTheme = {
            name = settings.icons;
            package = settings.iconsPkg;
        };
    };

    home.stateVersion = "23.05";
}
