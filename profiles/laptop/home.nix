{ config, pkgs, settings, ...}:
{
    imports = [
        ../../themes/lib/common.nix
        ../../themes/lib/home.nix
        ../../user/apps/spotify.nix
        ../../user/apps/kitty.nix
        ../../user/apps/git.nix
        ../../user/apps/btop
        ../../user/apps/superfile.nix
        ../../user/apps/zathura.nix
        ../../user/apps/nemu.nix
        ../../user/apps/cava.nix
        ../../user/apps/khal.nix
        ../../user/apps/neofetch
        ../../user/gaming/nethack.nix
        ../../user/apps/tlaplus.nix
        ../../user/apps/latex.nix
        ../../user/shells/${settings.shell}.nix
    ] ++ (map (wm: ../../user/wm/${wm}.nix) settings.wms)
      ++ (map (editor: ../../user/editors/${editor}) settings.editors)
      ++ (map (browser: ../../user/browsers/${browser}.nix) settings.browsers);

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
        tigervnc
        swayimg
        openvpn
        update-resolv-conf
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
        EDITOR = settings.preferredEditor;
        BROWSER = settings.preferredBrowser;
    };

    programs.home-manager.enable = true;
    home.stateVersion = "23.05";
}
