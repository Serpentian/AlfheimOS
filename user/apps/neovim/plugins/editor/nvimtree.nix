{
    programs.nixvim.plugins.nvim-tree = {
        enable = true;
    };

    programs.nixvim.keymaps = [
    {
        mode = ["n"];
        key = "<leader>e";
        options = {desc = "Open/Close NvimTree";};
        action.__raw = ''
            function()
                require("nvim-tree.api").tree.toggle()
            end
        '';
    }
    ];
}
