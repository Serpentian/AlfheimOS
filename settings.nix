{pkgs, inputs, ...}:
rec {
    system = "x86_64-linux";
    hostname = "alfheim"; # Hostname
    username = "serpentian"; # Username
    profile = "desktop"; # Select from profiles directory
    timezone = "Europe/Moscow"; # Select timezone
    locale = "en_US.UTF-8"; # Select locale
    name = "Nikita Zheleztsov"; # Name (git config)
    email = "n.zheleztsov@proton.me"; # Email (git config)
    dotfilesDir = "/home/${username}/.dotfiles"; # Absolute path of the repo;

    theme = "catppuccin"; # Selected theme from themes directory (./themes/)
    themeDetails = import (./. + "/themes/${theme}.nix") {inherit pkgs;};

    shell = "zsh"; # See user/shells directory.

    wms = ["hyprland" ]; # See user/wm/ and system/wm directories.
    editors = ["neovim"]; # See user/editors directory.
    browsers = ["zen-browser" "qutebrowser" ]; # See user/browsers directory.
    preferredEditor = "nvim"; # Session variable $TERM.
    preferredBrowser = "zen"; # Session variable $BROWSER.
}
