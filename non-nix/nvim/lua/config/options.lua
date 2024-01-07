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

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

if vim.g.neovide then
    vim.g.transparency = 0.8;
    vim.g.neovide_transparency = 0.8
    vim.opt.guifont = "RobotoMono Nerd Font:h12";
    vim.g.neovide_background_color = "#11111b" .. alpha();
end
