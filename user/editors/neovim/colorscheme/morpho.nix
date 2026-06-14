{
    programs.nixvim.colorschemes.rose-pine = {
        enable = true;
        settings = {
            # variant = "moon";
            styles = {
                bold = true;
                italic = false;
                transparency = true;
            };
            palette = {
                main = {
                    pine = "#c4a7e7";
                    iris = "#31748f";
                };
                moon = {
                    pine = "#c4a7e7";
                    iris = "#3e8fb0";
                };
                dawn = {
                    pine = "#907aa9";
                    iris = "#286983";
                };
            };
        };
    };
}
