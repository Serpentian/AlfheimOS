{
    programs.nixvim.plugins.gitsigns = {
        enable = true;
        settings = {
            current_line_blame = false;
            signs = {
                add = {
                    text = "▎";
                };
                change = {
                    text = "▎";
                };
                delete = {
                    text = "";
                };
                topdelete = {
                    text = "";
                };
                changedelete = {
                    text = "▎";
                };
                untracked = {
                    text = "▎";
                };
            };
        };
    };

    programs.nixvim.keymaps = [
    {
        mode = ["n"];
        key = "<leader>ghj";
        options = {desc = "Next hunk";};
        action = ":silent Gitsigns next_hunk<cr>";
    }
    {
        mode = ["n"];
        key = "<leader>ghk";
        options = {desc = "Previous hunk";};
        action = ":silent Gitsigns prev_hunk<cr>";
    }
    {
        mode = ["n" "v"];
        key = "<leader>ghs";
        options = {desc = "Stage hunk";};
        action = ":Gitsigns stage_hunk<cr>";
    }
    {
        mode = ["n" "v"];
        key = "<leader>ghr";
        options = {desc = "Reset hunk";};
        action = ":Gitsigns reset_hunk<cr>";
    }
    {
        mode = "n";
        key = "<leader>ghp";
        action = ":Gitsigns preview_hunk<CR>";
        options = {desc = "Preview hunk";};
    }
    {
        mode = "n";
        key = "<leader>ghu";
        action = ":Gitsigns undo_stage_hunk<CR>";
        options = {desc = "Undo stage hunk";};
    }
    {
        mode = "n";
        key = "<leader>ghb";
        action.__raw = ''
            function() require('gitsigns').blame_line({ full = true }) end
        '';
        options = {desc = "Blame line";};
    }
    {
        mode = "n";
        key = "<leader>ghB";
        action = ":Gitsigns blame<CR>";
        options = {desc = "Blame Buffer";};
    }
    {
        mode = "n";
        key = "<leader>ghd";
        action = ":Gitsigns diffthis<CR>";
        options = {desc = "Diff This";};
    }
    ];
}
