-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move to window using the <Space-w> hjkl keys
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to right window", remap = true })

-- Switch buffers with <Space-b>
vim.keymap.set("n", "<leader>bh", "[b", { desc = "Prev buffer", remap = true })
vim.keymap.set("n", "<leader>bl", "]b", { desc = "Next buffer", remap = true })
