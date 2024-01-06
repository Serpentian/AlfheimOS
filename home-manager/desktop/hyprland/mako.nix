{ custom, config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    backgroundColor = "#${custom.palette.primary_background_hex}";
    textColor = "#${custom.tertiary_accent}";
    borderColor = "#${custom.primary_accent}";
    progressColor = "#${custom.secondary_accent}";
    font = "${custom.font} ${custom.fontsize}";
    borderRadius = 15;
    margin = "15";
    padding = "10";
  };
}
