-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local options = {
    autoindent = true,
    clipboard = "unnamedplus", -- Sync with system clipboard
    colorcolumn = "81", -- Color line, after which nothing should be
    cmdheight = 0, -- Hide cmdline, when it's not used
    confirm = true, -- Confirm to save changes before exiting modified buffer
    list = true, -- Show some invisible characters (tabs...
    mouse = "a", -- Enable mouse mode
    number = true, -- Print line number
    relativenumber = true, -- Relative line numbers
    smartindent = true, -- Insert indents automatically
    undofile = true,
    undolevels = 10000,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
