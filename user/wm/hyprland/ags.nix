{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  home.packages = with pkgs; [
    sassc
  ];

  programs.ags = {
    enable = true;
    configDir = ../../../non-nix/ags;
    extraPackages = with pkgs; [
      libsoup_3
    ];
  };
}
