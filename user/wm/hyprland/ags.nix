{ inputs, pkgs, ... }: let
  asztal = pkgs.callPackage ../../../non-nix/ags/default.nix {inherit inputs;};
in {
  imports = [ inputs.ags.homeManagerModules.default ];
  home.packages = with pkgs; [
    asztal
    bun
    dart-sass
    fd
    brightnessctl
    swww
    inputs.matugen.packages.${system}.default
    slurp
    wf-recorder
    wl-clipboard
    wayshot
    swappy
    hyprpicker
    pavucontrol
    networkmanager
    gtk3
  ];

  programs.ags = {
    enable = true;
    configDir = ../../../non-nix/ags;
  };
}
