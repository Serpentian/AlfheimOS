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

    ###################
    # Computations    #
    ###################
    {
        mode = "n";
        key = "<leader>cm";
        action.__raw = ''
        function()
            local data = vim.fn.getreg('"')  -- get unnamed register
            if not data or data == "" then
                vim.notify("Register is empty", vim.log.levels.WARN)
                return
            end

            local lines = vim.split(data, "\n", { trimempty = true })
            local sum, count = 0, 0
            for _, line in ipairs(lines) do
                local num = tonumber(line)
                if num then
                    sum = sum + num
                    count = count + 1
                end
            end

            if count == 0 then
                vim.notify("No valid numbers found in register", vim.log.levels.ERROR)
                return
            end

            local mean = sum / count
            vim.notify(string.format("Mean = %.2f", mean), vim.log.levels.INFO)
        end
        '';
        options = {desc = "Compute mean from unnamed register";};
    }
    {
        mode = "v";
        key = "<leader>cc";
        action = "<cmd>'<,'>s/\\v(.+)/\\=submatch(1) . ' = ' . eval(submatch(1))<cr>";
        options = {desc = "Eval selected lines";};
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
