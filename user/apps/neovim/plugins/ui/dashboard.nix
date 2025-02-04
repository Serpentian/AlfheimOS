{
    programs.nixvim.plugins.dashboard = {
        enable = true;
        settings = {
            config = {
                footer = [
                    "" "" "Hacking to the Gate"
                ];
                shortcut = [
                    {
                        action = {
                            __raw = "function(path) vim.cmd('Telescope session-lens') end";
                        };
                        desc = "Session";
                        group = "Label";
                        icon = " ";
                        key = "s";
                    }
                ];
                mru = {
                    icon = "";
                    label = "";
                };
                project.enable = false;
                packages.enable = false;
                week_header.enable = true;
            };
            theme = "hyper";
        };
    };
}
