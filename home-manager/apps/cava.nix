{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    cava
  ];

  xdg.configFile.cava = {
    source = ../../non-nix/cava;
    recursive = true;
  };
}
