{
    programs.nixvim.colorschemes.gruvbox = {
        enable = true;
        settings = {
            transparent_mode = false;
            overrides = {
                BufferLineFill = {bg = "#282828";};
                SignColumn = {bg = "#282828";};
            };
            palette_overrides = {
                # TODO: use stylix for that
                dark0 = "#282828";
                dark1 = "#3c3836";
                dark2 = "#504945";
                dark3 = "#665c54";
                dark4 = "#7c6f64";
                light0 = "#fbf1c7";
                light1 = "#f4e8be";
                light2 = "#f2e5bc";
                light3 = "#eee0b7";
                light4 = "#e5d5ad";
                bright_red = "#ea6962";
                bright_green = "#a9b665";
                bright_yellow = "#d8a657";
                bright_blue = "#7daea3";
                bright_purple = "#d3869b";
                bright_aqua = "#89b482";
                bright_orange = "#e78a4e";
                neutral_red = "#cc241d";
                neutral_green = "#98971a";
                neutral_yellow = "#d79921";
                neutral_blue = "#458588";
                neutral_purple = "#b16286";
                neutral_aqua = "#689d6a";
                neutral_orange = "#d65d0e";
                dark_red = "#722529";
                dark_green = "#62693e";
                dark_aqua = "#49503b";
                gray = "#928374";
                faded_red = "#c14a4a";
                faded_green = "#6c782e";
                faded_yellow = "#647109";
                faded_blue = "#45707a";
                faded_purple = "#945e80";
                faded_aqua = "#4c7a5d";
                faded_orange = "#c35e0a";
                light_red = "#ae5858";
                light_green = "#ebeabc";
                light_aqua = "#dee2b6";
            };
        };
    };
}
