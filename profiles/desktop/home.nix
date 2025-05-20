{ inputs, config, pkgs, settings, ...}:
{
    imports = [
        ../../themes/lib/common.nix
        ../../themes/lib/home.nix
        ../../user/apps/kitty.nix
        ../../user/apps/git.nix
        ../../user/apps/superfile.nix
        ../../user/apps/zathura.nix
        ../../user/apps/nemu.nix
        ../../user/apps/cava.nix
        ../../user/apps/github.nix
        ../../user/apps/neofetch
        ../../user/apps/mangohud.nix
        ../../user/gaming/nethack.nix
        ../../user/gaming/steam.nix
        ../../user/apps/tlaplus.nix
        ../../user/apps/latex.nix
        ../../user/apps/btop
        ../../user/apps/mpd
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
        sysstat
        gnupg
        sway-contrib.grimshot
        libreoffice-fresh
        # obs-studio
        # tty-clock
        qbittorrent
        # rtorrent
        cpulimit
        swayimg
        vesktop
        # revolt-desktop
        telegram-desktop
        # wayvnc
        drawio
        # flacon
        krita
        gimp
        mpv

        # Test.
        weechat

        # Overclock
        dmidecode
        sysbench

        # Sometimes needed for work.
        # zoom-us
        chromium
        unzip
        # translate-shell
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
    home.stateVersion = "24.11";
}
