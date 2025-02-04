{
    programs.nixvim.plugins.auto-session = {
        enable = true;
        luaConfig.post = ''
        require('auto-session').setup {
            use_git_branch = true,
            auto_create = function()
                local cmd = 'git rev-parse --is-inside-work-tree'
                return vim.fn.system(cmd) == 'true\n'
            end,
            post_restore_cmds = {
                function()
                    -- Restore nvim-tree after a session is restored
                    local nvim_tree_api = require('nvim-tree.api')
                    nvim_tree_api.tree.open()
                    nvim_tree_api.tree.change_root(vim.fn.getcwd())
                    nvim_tree_api.tree.reload()
                end
            },
        }
        '';
    };
}
