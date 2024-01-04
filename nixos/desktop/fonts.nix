{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [
      "RobotoMono"
    ]; })
    # noto-fonts-cjk
  ];
}
