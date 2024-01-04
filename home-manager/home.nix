{ config, pkgs, ...}:

{
  imports = 
    [
      ./desktop/hyprland
      # ./shell/zsh.nix
      ./apps/git.nix
    ];

  home = {
    username = "serpentian";
    homeDirectory = "/home/serpentian";
  };

  home.packages = with pkgs; [
    kitty
    firefox
    libreoffice-fresh
    krita
    obs-studio
    gimp-with-plugins
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
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "kitty";
    BROWSER = "firefox";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
