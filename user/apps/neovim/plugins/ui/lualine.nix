{
    programs.nixvim.plugins.lualine = {
        enable = true;
        settings = {
            theme = "auto";
            extensions = ["fzf"];
            always_divide_middle = true;
            ignore_focus = ["neo-tree"];
            globalstatus = true;
            component_separators = {
                left = "|";
                right = "|";
            };
            section_separators = {
                left = "█"; # 
                right = "█"; # 
            };
            sections = {
                lualine_a = ["mode"];
                lualine_b = [
                    "branch"
                    "diff"
                    "diagnostics"
                ];
                lualine_c = ["filename"];
                lualine_x = ["filetype"];
                lualine_y = ["progress"];
                lualine_z = [''" " .. os.date("%R")''];
            };
        };
    };
}
