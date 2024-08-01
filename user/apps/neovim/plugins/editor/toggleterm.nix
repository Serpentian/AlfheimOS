{
    programs.nixvim.plugins.toggleterm = {
        enable = true;
        settings = {
            shell = "zsh";
            hide_numbers = true;
            start_in_insert = false;
            terminal_mappings = true;
            persist_mode = true;
            insert_mappings = true;
            close_on_exit = true;
            auto_scroll = true;
            winbar.enabled = false;
        };
    };

    programs.nixvim.autoGroups = {
        toggleterm = {};
    };

    programs.nixvim.autoCmd = [{
        group = "toggleterm";
        event = ["TermOpen"];
        pattern = ["term://*"];
        callback = {
            __raw = ''
                function()
                    local opts = {buffer = 0}
                    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
                end
            '';
        };
    }];

    programs.nixvim.keymaps = [{
        mode = ["n"];
        key = "<leader>t";
        options = {desc = "Open/Close Terminal";};
        action = "<cmd>ToggleTerm<cr>";
    }];

}

