vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window management
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to left window", remap = true})
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window", remap = true})
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window", remap = true})
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to right window", remap = true})
vim.keymap.set("n", "<leader>wq", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split window right", remap = true })

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- tabs
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>h", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
