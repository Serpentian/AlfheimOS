{pkgs, ...}:

[
    pkgs.tmuxPlugins.cpu
    {
        plugin = pkgs.tmuxPlugins.gruvbox;
        extraConfig = ''
            set -g @catppuccin_status_background "none"

            set -g status-right-length 100
            set -g status-left-length 100
            set -g status-left ""
            set -g status-right "#{E:@catppuccin_status_application}"
            set -agF status-right "#{E:@catppuccin_status_cpu}"
            set -ag status-right "#{E:@catppuccin_status_session}"
            set -ag status-right "#{E:@catppuccin_status_uptime}"
        '';
    }
]
