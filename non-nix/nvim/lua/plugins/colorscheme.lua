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
                mason = true,
                treesitter = true,
                notify = true,
                neotree = true,
            }
        }
        if not vim.g.neovide then
            -- Disables setting the background color with terminal.
            settings.transparent_background = true 
        else
            -- Otherwise we overwrite background color to be the same, as in terminal.
            settings.highlight_overrides = {
                mocha = function(mocha)
                    return {
                        Normal = {bg = "#11111b" },
                    }
                end,
            }
        end
        require("catppuccin").setup(settings)
        vim.cmd.colorscheme("catppuccin")
    end,
}
