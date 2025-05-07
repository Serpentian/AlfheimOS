{pkgs, settings, ...}: let
    theme = import ./themes/${settings.theme}.nix { inherit pkgs; };
in {
    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        prefix = "C-s";
        terminal = "tmux-256color";
        escapeTime = 0;
        mouse = true;
        historyLimit = 10000;
        disableConfirmationPrompt = true;
        plugins = with pkgs.tmuxPlugins; [
            vim-tmux-navigator
            {
                plugin = resurrect;
                extraConfig = ''
                    set -g @resurrect-capture-pane-contents 'on'
                    set -g @resurrect-processes '"~nvim->nvim" lazygit'
                '';
            }
        ] ++ theme;
        extraConfig = ''
  # Empty line before status bar
  set -Fg 'status-format[1]' '#{status-format[0]}'
  set -g 'status-format[0]' ""
  set -g status 2

  ####################
  #     Shortcuts    #
  ####################

  # Reload config.
  unbind r
  bind r source-file ~/.config/tmux/tmux.conf

  # Move between windows
  bind-key -n C-Left previous-window
  bind-key -n C-Right next-window
        '';
    };
}
