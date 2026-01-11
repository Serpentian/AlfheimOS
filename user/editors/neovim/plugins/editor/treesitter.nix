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
        # All parsers are installed by default.
        settings = {
            indent.enable = true;
            highlight.enable = true;
            playground.enable = true;
            auto_install = true;
        };
    };
}
