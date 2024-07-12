{ config, pkgs, ... }:

{
    programs.cava = {
        enable = true;
        settings = {
            color = {
                gradient = 1;
                gradient_color_1 = "'#${config.lib.stylix.colors.base0C}'";
                gradient_color_2 = "'#${config.lib.stylix.colors.base0D}'";
                gradient_color_3 = "'#${config.lib.stylix.colors.base07}'";
                gradient_color_4 = "'#${config.lib.stylix.colors.base0E}'";
                gradient_color_5 = "'#${config.lib.stylix.colors.base06}'";
                gradient_color_6 = "'#${config.lib.stylix.colors.base0A}'";
                gradient_color_7 = "'#${config.lib.stylix.colors.base0F}'";
                gradient_color_8 = "'#${config.lib.stylix.colors.base08}'";
            };
        };
    };
}
