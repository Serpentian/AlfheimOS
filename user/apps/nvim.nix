{ config, pkgs, settings, ...}:
{
    # Neovim specific packages.
    home.packages = with pkgs; [
        neovide
        ripgrep
        lazygit
        fd
    ];

    # Neovim linking. Don't like configuring NeoVim with Nix.
    xdg.configFile.nvim = {
        source = ../../non-nix/nvim;
        recursive = true;
    };
}
