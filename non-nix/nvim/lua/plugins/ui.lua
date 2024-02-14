return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>bh", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
            { "<leader>bl", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        },
        opts = {
            options = {
                always_show_bufferline = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "NvimTree",
                        text_align = "left",
                        separator = true,
                    },
                },
            },
        },
        config = function(_, opts)
            require("bufferline").setup(opts)
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = "catppuccin"
            }
        },
        config = function(_, opts)
            require("lualine").setup(opts)
        end
    }
}
