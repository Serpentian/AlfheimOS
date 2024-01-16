{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [
      "Hack"
    ]; })
    # noto-fonts-cjk
  ];
}
