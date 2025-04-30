{ settings, lib, pkgs, ... }:
{
    home.packages = with pkgs; [
        ripgrep
        neovide
    ];

    imports = [
        ./autocmds.nix
        ./keymaps.nix
        ./options.nix
        ./neovide.nix

        # Editor plugins
        ./plugins/editor/nvimtree.nix
        ./plugins/editor/vimtex.nix
        ./plugins/editor/treesitter.nix
        ./plugins/editor/gitsigns.nix
        ./plugins/editor/whichkey.nix
        ./plugins/editor/telescope.nix
        ./plugins/editor/toggleterm.nix
        ./plugins/editor/mini.nix
        ./plugins/editor/markdown.nix
        ./plugins/editor/session.nix
        ./plugins/editor/tmux-navigator.nix

        # UI plugins
        ./plugins/ui/bufferline.nix
        ./plugins/ui/lualine.nix
        ./plugins/ui/dashboard.nix
    ] ++ lib.optional (settings.themeDetails.themeName != null)
        ./colorscheme/${settings.theme}.nix;

    programs.nixvim.enable = true;
}
