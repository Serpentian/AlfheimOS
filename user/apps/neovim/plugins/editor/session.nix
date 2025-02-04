{
    programs.nixvim.plugins.auto-session = {
        enable = true;
        settings = {
            use_git_branch = true;
            auto_create.__raw = ''
            function()
                local cmd = 'git rev-parse --is-inside-work-tree'
                return vim.fn.system(cmd) == 'true\n'
            end
            '';
        };
    };
}
