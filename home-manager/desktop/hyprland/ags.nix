{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    # configDir = ../../../non-nix/ags;
    extraPackages = [ pkgs.libsoup_3 ];
  };
}
