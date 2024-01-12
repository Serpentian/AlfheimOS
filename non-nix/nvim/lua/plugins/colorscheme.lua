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
                cmp = true,
                mason = true,
                treesitter = true,
                notify = true,
                neotree = true,
                noice = true,
                window_picker = true,
                which_key = true,
                neotree = true,
            }
        }
        require("catppuccin").setup(settings)
        vim.cmd.colorscheme("catppuccin")
    end,
}
