{ config, pkgs, ... }:

{
  imports = 
    [ 
      ./wayland.nix
      ./fonts.nix
    ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };
}
