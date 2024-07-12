{ pkgs, ... }:
{
    programs.nixvim.plugins.treesitter = {
        enable = true;
        folding = true;
        nixvimInjections = true;
        settings = {
            indent.enable = true;
            highlight.enable = true;
            playground.enable = true;
        };
    };
}
