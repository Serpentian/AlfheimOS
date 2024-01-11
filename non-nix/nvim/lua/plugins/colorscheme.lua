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
            integration = {
                cmp = true,
                mason = true,
                treesitter = true,
                notify = true,
                neotree = true,
                noice = true,
            }
        }
        require("catppuccin").setup(settings)
        vim.cmd.colorscheme("catppuccin")
    end,
}
