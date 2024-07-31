{ settings, lib, pkgs, ... }:
{
    home.packages = with pkgs; [
        ripgrep
    ];

    imports = [
        ./autocmds.nix
        ./keymaps.nix
        ./options.nix

        # Editor plugins
        ./plugins/editor/nvimtree.nix
        ./plugins/editor/treesitter.nix
        ./plugins/editor/gitsigns.nix
        ./plugins/editor/whichkey.nix
        ./plugins/editor/telescope.nix
        ./plugins/editor/mini.nix

        # UI plugins
        ./plugins/ui/bufferline.nix
        ./plugins/ui/lualine.nix
    ] ++ lib.optional (settings.themeDetails.themeName != null)
        ./colorscheme/${settings.theme}.nix;

    programs.nixvim.enable = true;
}
