-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local options = {
    expandtab = true,                        -- convert tabs to spaces
    tabstop = 4,                             -- insert 4 spaces for a tab
    softtabstop = 4,                         -- fine tune the amount of spaces added
    shiftwidth = 4,                          -- the amount of spaces in normal mode
    showtabline = 4,                         -- always show tabs
    colorcolumn = "81",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
