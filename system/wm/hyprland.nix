{ inputs, config, pkgs, ... }:

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
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };
}
