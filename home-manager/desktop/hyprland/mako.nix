{ custom, config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    backgroundColor = "#${custom.palette.primary_background_hex}";
    textColor = "#${custom.tertiary_accent}";
    progressColor = "#${custom.secondary_accent}";
    font = "${custom.font} ${custom.fontsize}";
    borderRadius = 15;
    margin = "15";
    padding = "10";
    height = 1000;
    width = 400;
    borderSize = 0;
    defaultTimeout = 5000;
    extraConfig = ''
      [app-name="spotify_player"]
      invisible=1
    '';
  };
}
