{
    programs.nixvim.colorschemes.nord = {
        enable = true;
        settings = {
            italic = false;
            disable_background = true;
            borders = false;
        };
    };

    programs.nixvim.extraConfigLua = ''
if vim.g.neovide then
    vim.g.nord_disable_background = false
    require('nord').set()
end
    '';
}
