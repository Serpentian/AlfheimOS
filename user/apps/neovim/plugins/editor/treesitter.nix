{ pkgs, ... }:
{
    home.packages = with pkgs; [
        # Any C compiler is required for proper work of the treesitter.
        gcc
    ];

    programs.nixvim.plugins.treesitter = {
        enable = true;
        folding = false;
        nixvimInjections = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            json
            tlaplus
            latex
        ];
        settings = {
            indent.enable = true;
            highlight.enable = true;
            playground.enable = true;
            auto_install = true;
        };
    };
}
