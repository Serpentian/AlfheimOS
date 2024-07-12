{
    programs.nixvim.plugins.telescope = {
        enable = true;
        extensions = {
            fzf-native = {
                enable = true;
            };
            ui-select = {
                settings = {
                    specific_opts = {
                        codeactions = true;
                    };
                };
            };
            undo = {
                enable = true;
            };
        };
# If you'd prefer Telescope not to enter a normal-like mode when hitting escape (and instead exiting), you can map <Esc> to do so via:
        settings = {
            defaults = {
                mappings = {
                    i = {
                        "<esc>" = {
                            __raw = ''
                                function(...)
                                return require("telescope.actions").close(...)
                                end'';
                        };
                    };
                };
            };
        };

        keymaps = {
            "<leader><space>" = {
                action = "find_files";
                options.desc = "Find project files";
            };
            "<leader>/" = {
                action = "live_grep";
                options.desc = "Grep (root dir)";
            };
            "<leader>:" = {
                action = "command_history";
                options.desc = "Command History";
            };
            "<leader>fb" = {
                action = "buffers";
                options.desc = "+buffer";
            };
            "<leader>ff" = {
                action = "find_files";
                options.desc = "Find project files";
            };
            "<leader>fr" = {
                action = "oldfiles";
                options.desc = "Recent";
            };
            "<leader>gf" = {
                action = "git_files";
                options.desc = "Search git files";
            };
            "<leader>gc" = {
                action = "git_commits";
                options.desc = "Commits";
            };
            "<leader>gs" = {
                action = "git_status";
                options.desc = "Status";
            };
        };
    };
}
