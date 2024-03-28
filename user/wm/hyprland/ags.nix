{ inputs, pkgs, ... }: let
  asztal = pkgs.callPackage ../../../non-nix/ags/default.nix {inherit inputs;};
in {
  imports = [ inputs.ags.homeManagerModules.default ];
  home.packages = with pkgs; [
    asztal
    bun
    dart-sass
    gtk3
    pulsemixer
  ];

  programs.ags = {
    enable = true;
    configDir = ../../../non-nix/ags;
  };
}
