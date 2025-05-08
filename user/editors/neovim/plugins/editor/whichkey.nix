{
    programs.nixvim.plugins.which-key = {
        enable = true;
        settings = {
            ignoreMissing = false;
            icons = {
                breadcrumb = "»";
                group = "+";
                separator = ""; # ➜
            };
            spec = [
            {
                __unkeyed-1 = "g";
                group = "+goto";
            }
            {
                __unkeyed-1 = "q";
                group = "+quit";
            }
            {
                __unkeyed-1 = "]";
                group = "+next";
            }
            {
                __unkeyed-1 = "[";
                group = "+prev";
            }
            {
                __unkeyed-1 = "<leader><tab>";
                group = "+tab";
            }
            {
                __unkeyed-1 = "<leader>b";
                group = "+buffer";
            }
            {
                __unkeyed-1 = "<leader>g";
                group = "+git";
            }
            {
                __unkeyed-1 = "<leader>gh";
                group = "+hunk";
            }
            {
                __unkeyed-1 = "<leader>w";
                group = "+window";
            }
            {
                __unkeyed-1 = "<leader>s";
                group = "+search";
            }
            {
                __unkeyed-1 = "<leader>t";
                group = "+terminal";
            }
            ];
            win = {
                border = "single";
            };
        };
    };
}
