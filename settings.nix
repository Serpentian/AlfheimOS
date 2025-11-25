{pkgs, inputs, ...}:
rec {
    # Basic configuration.
    system = "x86_64-linux";
    profile = "desktop"; # Select from profiles directory
    hostname = "alfheim"; # Hostname
    username = "serpentian"; # Username
    timezone = "Europe/Moscow"; # Select timezone
    locale = "en_US.UTF-8"; # Select locale
    name = "Nikita Zheleztsov"; # Name (git config)
    email = "n.zheleztsov@proton.me"; # Email (git config)
    dotfilesDir = "/home/${username}/.dotfiles"; # Absolute path of the repo;

    # App configurations.
    shell = "zsh"; # See user/shells directory.
    editors = ["neovim"]; # See user/editors directory.
    browsers = ["zen-browser" "qutebrowser" ]; # See user/browsers directory.
    preferredEditor = "nvim"; # Session variable $TERM.
    preferredBrowser = "zen"; # Session variable $BROWSER.

    # WM and theming.
    wms = ["hyprland" ]; # See user/wm/ and system/wm directories.
    theme = "catppuccin"; # Selected theme from themes directory (./themes/)

    # Do not change these!
    themeDetails = import (./. + "/themes/${theme}.nix") {inherit pkgs;};
}
