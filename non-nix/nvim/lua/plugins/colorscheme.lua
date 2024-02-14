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
            },
            custom_hightlights = function(colors)
                return {
                    NvimTreeWindowPicker = {bg = "#11111b" },
                }
            end
        }
        if vim.g.neovide then
            settings.transparent_background = false
            settings.custom_highlights = function(colors)
                return {
                    Normal = { bg = "#11111b" },
                    NormalNC = { bg = "#11111b" },
                    NvimTreeNormal = { bg = "#11111b" },
                    NvimTreeWindowPicker = { bg = "#11111b" },
                    NvimTreeStatuslineNc = { bg = "#11111b" },
                    NvimTreeWinSeparator = { bg = "#11111b" },
                    StatusLine = { bg = "#11111b" },
                    StatusLineNC = { bg = "#11111b" },
                    TabLine = { bg = "#11111b" },
                    CursorColumn = { bg = "#11111b" },
                    NormalFloat = { bg = "#11111b" },
                    FlashCurrent = { bg = "#11111b" },
                    FlashLabel = { bg = "#11111b" },
                    FlashMatch = { bg = "#11111b" },
                    debugBreakpoint = { bg = "#11111b" },
                    mkdCodeDelimiter = { bg = "#11111b" },
                    lualine_a_inactive = { bg = "#11111b" },
                    lualine_b_inactive = { bg = "#11111b" },
                    lualine_c_inactive = { bg = "#11111b" },
                    lualine_c_normal = { bg = "#11111b" },
                    lualine_transitional_lualine_a_normal_to_lualine_c_normal = { bg = "#11111b" },
                    lualine_transitional_lualine_b_normal_to_lualine_c_normal = { bg = "#11111b" },
                    lialine_x_filetype_DevIconDefault_normal = { bg = "#11111b" },
                    lialine_x_filetype_DevIconDefault_insert = { bg = "#11111b" },
                    lialine_x_filetype_DevIconDefault_visual = { bg = "#11111b" },
                    lialine_x_filetype_DevIconDefault_replace = { bg = "#11111b" },
                    lialine_x_filetype_DevIconDefault_command = { bg = "#11111b" },
                    lialine_x_filetype_DevIconDefault_terminal = { bg = "#11111b" },
                    lialine_x_filetype_DevIconDefault_inactive = { bg = "#11111b" },
                }
            end
        end
        require("catppuccin").setup(settings)
        vim.cmd.colorscheme("catppuccin")
    end,
}
