{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [
      "JetBrainsMono"
    ]; })
    # noto-fonts-cjk
  ];
}
