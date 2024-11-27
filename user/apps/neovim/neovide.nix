{settings, ...}: let
    opacity = builtins.toString settings.themeDetails.opacity;
    fontSize = builtins.toString settings.fontSize;
in {
    programs.nixvim.extraConfigLua = ''
if vim.g.neovide then
    vim.g.neovide_refresh_rate = 120
    vim.g.neovide_transparency = ${opacity}
    vim.o.guifont = "${settings.font}:h${fontSize}"
    vim.g.neovide_padding_top = 15
end
    '';
}
