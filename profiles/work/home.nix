{ config, pkgs, settings, ...}:
let
    custom = import (./. + "../../../themes/" + ("/" + settings.theme) + ".nix") {inherit pkgs;};
in
{
    _module.args = { inherit custom; };
    imports = [
        (./. + "../../../user/wm" + ("/" + settings.wm) + ".nix")
        ../../user/apps/w3m.nix
        ../../user/apps/spotify.nix
        ../../user/apps/kitty.nix
        ../../user/apps/git.nix
        ../../user/apps/btop.nix
        ../../user/apps/ranger.nix
        ../../user/apps/zathura.nix
        ../../user/apps/nemu.nix
        ../../user/apps/cava.nix
        ../../user/apps/neofetch
        ../../user/shell/zsh.nix
        ../../user/hardware/mouse.nix
    ];

    home = {
        username = settings.username;
        homeDirectory = "/home/${settings.username}";
    };

    # Add packages from the pkgs dir
    nixpkgs.overlays = import ../../lib/overlays.nix;
    nixpkgs.config.allowUnfree = true; # Sorry, Stallman(
    home.packages = with pkgs; [
        neovide
        # Neovim specific packages.
        ripgrep
        lazygit
        fd

        kitty
        firefox
        libreoffice-fresh
        obs-studio
        gimp-with-plugins
        sway-contrib.grimshot
        swayimg

        vesktop
        distrobox
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
            XDG_DOTFILES_DIR = "${config.home.homeDirectory}/${settings.dotfilesDir}";
            XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
        };
    };

    # Neovim linking. Don't like configuring NeoVim with Nix.
    xdg.configFile.nvim = {
        source = ../../non-nix/nvim;
        recursive = true;
    };

    xdg.dataFile.icons = {
        source = ../../non-nix/icons;
        recursive = true;
    };

    home.sessionVariables = {
        EDITOR = settings.editor;
        TERM = settings.term;
        BROWSER = settings.browser;
    };

    gtk = {
        enable = true;
        theme = custom.gtkTheme;
        iconTheme = {
            name = settings.icons;
            package = settings.iconsPkg;
        };
        font = {
            name = settings.font;
            size = settings.fontSize;
        };
    };

    services.kdeconnect.enable = true;
    programs.home-manager.enable = true;
    home.stateVersion = "23.05";
}
