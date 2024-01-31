{ config, pkgs, ... }:

{
  imports =
    [
      # Hardware configuration.
      ./hardware/hardware-configuration.nix
      ./hardware/network.nix
      ./hardware/graphic.nix
      ./hardware/sound.nix
      ./hardware/mouse.nix
      ./hardware/boot.nix
      ./gaming/steam.nix
      ./virtualization/docker.nix
      # Window manager or desktop environment.
      ./desktop/hyprland.nix
    ];

  # Network.
  networking.hostName = "alfheim";
  networking.dhcpcd.enable = true;

  # Time.
  time.timeZone = "Europe/Moscow";
  services.chrony.enable = true;

  # Locale.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ALL = "en_US.UTF-8";
  };

  # Users.
  users.users.serpentian = {
    isNormalUser = true;
    description = "serpentian";
    extraGroups = [ "wheel" ];
  };

  # List of globally installed packages.
  environment.systemPackages = with pkgs; [
    home-manager
    pciutils
    neovim
    wget
    git
    zsh
  ];

  # Use zsh.
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # A lot of mpris packages require it.
  services.gvfs.enable = true;

  # Nix config.
  nixpkgs.overlays = import ../lib/overlays.nix;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
