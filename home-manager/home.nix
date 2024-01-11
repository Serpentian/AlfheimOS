{ config, pkgs, ...}:
let
  # Variables to share accross configs
  custom = {
    font = "RobotoMono Nerd Font";
    fontsize = "12";
    primary_accent = "cba6f7";
    secondary_accent= "89b4fa";
    # tertiary_accent = "f5f5f5";
    tertiary_accent = "cdd6f4";
    background = "11111B";
    opacity = "1";
    cursor = "Numix-Cursor";
    palette = import ./colors;
  };
in
{
  _module.args = { inherit custom; };
  imports = 
    [
      ./desktop/hyprland
      ./apps/w3m.nix
      ./apps/spotify.nix
      ./apps/kitty.nix
      ./apps/git.nix
      ./apps/btop.nix
      ./apps/ranger.nix
      ./shell/zsh.nix
    ];

  home = {
    username = "serpentian";
    homeDirectory = "/home/serpentian";
  };

  home.packages = with pkgs; [
    # Neovim specific packages.
    neovide
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
    hyprpicker
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

  # Neovim linking. Don't like configuring NeoVim with Nix.
  xdg.configFile.nvim = {
    source = ../non-nix/nvim;
    recursive = true;
  };

  xdg.dataFile.icons = {
    source = ../non-nix/icons;
    recursive = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "kitty";
    BROWSER = "firefox";
  };

  qt.enable = true;
  qt.platformTheme = "qtct";
  qt.style.name = "kvantum";

  xdg.configFile.Kvantum = {
    source = ../non-nix/Kvantum;
    recursive = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "standard";
        variant = "mocha";
      };
    };
  };

  services.kdeconnect.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
