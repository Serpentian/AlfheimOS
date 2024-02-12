{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    w3m
  ];

  home.file.".w3m/config".text = ''
    inline_img_protocol 4
    imgdisplay /usr/bin/kitten icat 2>/dev/null
  '';
}
