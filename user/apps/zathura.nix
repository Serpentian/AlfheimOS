{ pkgs, lib, settings, config, ... }: let
    fontSize = builtins.toString settings.themeDetails.fontSize;
in {
    programs.zathura = {
        enable = true;
        options = {
            font = "${settings.themeDetails.font} ${fontSize}";
            selection-clipboard = "clipboard";
            recolor = true;
            # Enable transparency.
            recolor-lightcolor = lib.mkForce "rgba(0,0,0,0)";
            recolor-darkcolor = lib.mkForce "#${config.lib.stylix.colors.base05}";
        };
    };
}
