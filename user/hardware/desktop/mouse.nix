{ config, pkgs, ...}:
{
  xdg.configFile.input-remapper-2 = {
    source = ../../../non-nix/input-remapper;
    recursive = true;
  };
}
