{pkgs, ...}:

[
    {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = ''
            set -g @catppuccin_status_background "none"
        '';
    }
]
