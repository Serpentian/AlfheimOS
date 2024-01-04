{ config, pkgs, ... }:

{
  environment.systemPackages = [ 
    pkgs.wayland
    pkgs.wl-clipboard
  ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    layout = "us,ru";
    xkbVariant = "";
    xkbOptions = "grp:win_space_toggle";
  };

  # Enable display manager.
  services.gnome.gnome-keyring.enable = true;
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
}
