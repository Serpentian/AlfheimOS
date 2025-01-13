{ config, pkgs, ... }:

{
  home.file.".config/MangoHud/MangoHud.conf".text = ''
preset=1
font_size=30
background_alpha=0.0
  '';
}
