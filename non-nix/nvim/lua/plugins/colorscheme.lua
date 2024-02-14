return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        local settings = {
            flavor = "mocha";
            transparent_background = true;
            dim_inactive = {
                enabled = false;
            },
            integrations = {
                gitsigns = true,
                treesitter = true,
                nvimtree = true,
                which_key = true,
            }
        }
        if vim.g.neovide then
            settings.transparent_background = false
            settings.custom_highlights = function(colors)
                return {
                    Normal = { bg = "#11111b" },
                }
            end
        end
        require("catppuccin").setup(settings)
        vim.cmd.colorscheme("catppuccin")
    end,
}
