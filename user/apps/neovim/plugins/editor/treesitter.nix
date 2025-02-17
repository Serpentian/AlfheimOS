{ pkgs, ... }:
{
    programs.nixvim.plugins.treesitter = {
        enable = true;
        folding = false;
        nixvimInjections = true;
        settings = {
            indent.enable = true;
            highlight.enable = true;
            playground.enable = true;
            auto_install = true;
            ensure_installed = [
                "tlaplus"
            ];
        };
    };
}
