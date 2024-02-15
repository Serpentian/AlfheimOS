{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.wayland
    pkgs.wl-clipboard
  ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
        variant = "";
        layout = "us,ru";
        options = "grp:win_space_toggle";
    };
  };

  # Enable display manager.
  services.gnome.gnome-keyring.enable = true;
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
}
