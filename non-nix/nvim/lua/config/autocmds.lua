-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd('FileType', {
    group = augroup("spaces"),
    pattern = { "*" },
    callback = function()
        vim.opt.expandtab = true   -- convert tabs to spaces
        vim.opt.tabstop = 4        -- insert 8 spaces for a tab
        vim.opt.softtabstop = 4    -- fine tune the amount of spaces added
        vim.opt.shiftwidth = 4     -- the amount of spaces in normal mode
        vim.opt.smarttab = true    -- insert blanks on Tab key
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    group = augroup("tabs"),
    pattern = { "c" },
    callback = function()
        vim.opt.expandtab = false  -- don't convert tabs to spaces
        vim.opt.tabstop = 8        -- insert 8 spaces for a tab
        vim.opt.softtabstop = 0    -- fine tune the amount of spaces added
        vim.opt.shiftwidth = 8     -- the amount of spaces in normal mode
    end,
})

-- Executed automatically on save.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("remove_trailing_whitespace"),
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
