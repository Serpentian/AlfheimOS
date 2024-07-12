{
    programs.nixvim.autoGroups = {
        spaces = {};
        tabs = {};
        removeTrailingSpace = {};
    };

    programs.nixvim.autoCmd = [
    {
        group = "spaces";
        event = ["FileType"];
        pattern = "*";
        callback = {
            __raw = ''
            function()
                vim.opt.expandtab = true   -- convert tabs to spaces
                vim.opt.tabstop = 4        -- insert 8 spaces for a tab
                vim.opt.softtabstop = 4    -- fine tune the amount of spaces added
                vim.opt.shiftwidth = 4     -- the amount of spaces in normal mode
                vim.opt.smarttab = true    -- insert blanks on Tab key
            end
            '';
        };
    }
    {
        group = "tabs";
        event = ["FileType"];
        pattern = ["c" "cpp"];
        callback = {
            __raw = ''
            function()
                vim.opt.expandtab = false  -- don't convert tabs to spaces
                vim.opt.tabstop = 8        -- insert 8 spaces for a tab
                vim.opt.softtabstop = 0    -- fine tune the amount of spaces added
                vim.opt.shiftwidth = 8     -- the amount of spaces in normal mode
            end
            '';
        };
    }
    {
        group = "removeTrailingSpace";
        event = ["BufWritePre"];
        pattern = "*";
        callback = {
            __raw = ''
            function(ev)
                save_cursor = vim.fn.getpos(".")
                vim.cmd([[%s/\s\+$//e]])
                vim.fn.setpos(".", save_cursor)
            end
            '';
        };
    }
    ];
}
