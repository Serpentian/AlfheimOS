{...}:
{
    programs.nixvim.plugins.gitlinker = {
        enable = true;
        settings = {
            add_current_line_on_normal_mode = true;
        };
    };

    programs.nixvim.keymaps = [
    {
        mode = "n";
        key = "<leader>ghy";
        options = {desc = "Copy git permalink";};
        action.__raw = ''
            function()
                require("gitlinker").get_buf_range_url("n", {
                    action_callback = require("gitlinker.actions").copy_to_clipboard
                })
            end
        '';
    }
    {
        mode = "v";
        key = "<leader>ghy";
        options = {desc = "Copy git permalink";};
        action.__raw = ''
            function()
                require("gitlinker").get_buf_range_url("v", {
                    action_callback = require("gitlinker.actions").copy_to_clipboard
                })
            end
        '';
    }
    ];
}
