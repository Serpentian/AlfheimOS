{
    programs.nixvim.globals.mapleader = " ";
    programs.nixvim.keymaps = [
    #####################
    # Window management #
    #####################
    {
        mode = "n";
        key = "<leader>wh";
        action = "<C-w>h";
        options = {desc = "Go to left window"; remap = true;};
    }
    {
        mode = "n";
        key = "<leader>wj";
        action = "<C-w>j";
        options = {desc = "Go to lower window"; remap = true;};
    }
    {
        mode = "n";
        key = "<leader>wk";
        action = "<C-w>k";
        options = {desc = "Go to upper window"; remap = true;};
    }
    {
        mode = "n";
        key = "<leader>wl";
        action = "<C-w>l";
        options = {desc = "Go to right window"; remap = true;};
    }
    {
        mode = "n";
        key = "<leader>wq";
        action = "<C-w>c";
        options = {desc = "Delete window"; remap = true;};
    }
    {
        mode = "n";
        key = "<leader>ws";
        action = "<C-w>s";
        options = {desc = "Split window below"; remap = true;};
    }
    {
        mode = "n";
        key = "<leader>wv";
        action = "<C-w>v";
        options = {desc = "Split window right"; remap = true;};
    }

    ###################
    # Tabs management #
    ###################
    {
        mode = "n";
        key = "<leader><tab><tab>";
        action = "<cmd>tabnew<cr>";
        options = {desc = "New tab";};
    }
    {
        mode = "n";
        key = "<leader><tab>l";
        action = "<cmd>tabnext<cr>";
        options = {desc = "Next tab";};
    }
    {
        mode = "n";
        key = "<leader><tab>q";
        action = "<cmd>tabclose<cr>";
        options = {desc = "Close tab";};
    }
    {
        mode = "n";
        key = "<leader><tab>h";
        action = "<cmd>tabprevious<cr>";
        options = {desc = "Previous tab";};
    }

    ########
    # Misc #
    ########
    {
        mode = "n";
        key = "<leader>qq";
        action = "<cmd>qa<cr>";
        options = {desc = "Quit all";};
    }
    {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>noh<cr>";
        options = {desc = "Quit all";};
    }
    ];
}
