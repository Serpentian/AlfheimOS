{pkgs, ...}:
rec {
    system = "x86_64-linux";
    hostname = "alfheim"; # Hostname
    username = "serpentian"; # Username
    profile = "desktop"; # Select from profiles directory
    timezone = "Europe/Moscow"; # Select timezone
    locale = "en_US.UTF-8"; # Select locale
    name = "Nikita Zheleztsov"; # Name (git config)
    email = "n.zheleztsov@proton.me"; # Email (git config)
    dotfilesDir = "/home/${username}/.dotfiles"; # Absolute path of the local repo
    theme = "gruvbox"; # Selected theme from themes directory (./themes/)
    themeDetails = import (./. + "/themes/${theme}.nix") {dir = dotfilesDir;};
    wm = ["hyprland"]; # Selected window manager or desktop environment;
                       # must select one in both ./user/wm/ and ./system/wm/
                       # Note, that first WM is included into work profile
                       # second one includes both.

    font = "FiraCode Nerd Font"; # Selected font
    fontPkg = (pkgs.nerd-fonts.fira-code);
    fontSize = 13; # Font size

    icons = "Papirus";
    iconsPkg = pkgs.papirus-icon-theme;

    # Session variables.
    editor = "nvim"; # Default editor
    editorPkg = pkgs.neovim;
    browser = "qutebrowser"; # Default browser; must select one from ./user/app/browser/
    browserPkg = pkgs.qutebrowser;
    term = "kitty"; # Default terminal command
    termPkg = pkgs.kitty;
}
