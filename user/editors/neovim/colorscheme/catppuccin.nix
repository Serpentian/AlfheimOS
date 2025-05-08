{
    programs.nixvim.colorschemes.catppuccin = {
        enable = true;
        settings = {
            flavours = "mocha";
            transparent_background = true;
        };
    };

    programs.nixvim.extraConfigLua = ''
if vim.g.neovide then
    require('catppuccin').setup({
        transparent_background = false,
        color_overrides = {
            mocha = {
                base = "#11111b",
            },
        },
    })
    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
end
    '';

}
