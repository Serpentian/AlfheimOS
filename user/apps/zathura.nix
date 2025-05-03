{ pkgs, lib, settings, config, ... }:

{
    programs.zathura = {
        enable = true;
        options = {
            font = "${settings.font} 12";
            selection-clipboard = "clipboard";
            recolor = true;
            # Enable transparency.
            recolor-lightcolor = lib.mkForce "rgba(0,0,0,0)";
            recolor-darkcolor = lib.mkForce "#${config.lib.stylix.colors.base05}";
        };
    };
}
