{
    programs.nixvim.plugins.which-key = {
        enable = true;
        ignoreMissing = false;
        icons = {
            breadcrumb = "»";
            group = "+";
            separator = ""; # ➜
        };
        registrations = {
            "g" = "+goto";
            "q" = "+quit";
            "]" = "+next";
            "[" = "+prev";
            "<leader><tab>" = "+tab";
            "<leader>b" = "+buffer";
            "<leader>g" = "+git";
            "<leader>gh" = "+hunk";
            "<leader>w" = "+window";
            "<leader>s" = "+search";
        };
        window = {
            border = "single";
            winblend = 0;
        };
    };
}
