{ pkgs, ... }:
{
    home.packages = with pkgs; [
        # Any C compiler is required for proper work of the treesitter.
        gcc
        tree-sitter
        nodejs
    ];

    programs.nixvim.plugins.treesitter = {
        enable = true;
        folding = false;
        nixvimInjections = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            json
            tlaplus
            latex
            bibtex
        ];
        settings = {
            indent.enable = true;
            highlight.enable = true;
            playground.enable = true;
            auto_install = true;
        };
    };
}
