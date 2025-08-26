{...}:
{
    programs.nixvim.plugins.gitlinker = {
        enable = true;
        addCurrentLineOnNormalMode = true;
        callbacks = {
            "bitbucket.org" = "get_bitbucket_type_url";
            "codeberg.org" = "get_gitea_type_url";
            "git.kernel.org" = "get_cgit_type_url";
            "git.savannah.gnu.org" = "get_cgit_type_url";
            "github.com" = "get_github_type_url";
            "gitlab.com" = "get_gitlab_type_url";
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
                    action_callback = require("gitlinker.actions").copy_to_cliboard
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
                    action_callback = require("gitlinker.actions").copy_to_cliboard
                })
            end
        '';
    }
    ];
}
