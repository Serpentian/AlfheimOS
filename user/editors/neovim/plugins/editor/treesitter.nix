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
        folding.enable = false;
        nixvimInjections = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            bash
            json
            lua
            make
            markdown
            nix
            regex
            xml
            yaml
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
