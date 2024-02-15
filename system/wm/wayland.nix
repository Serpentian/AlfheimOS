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
    displayManager.startx.enable = true;
  };
}
