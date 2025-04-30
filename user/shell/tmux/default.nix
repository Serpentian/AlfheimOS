{pkgs, settings, ...}: let
    theme = import ./themes/${settings.theme}.nix { inherit pkgs; };
in {
    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        prefix = "C-s";
        terminal = "tmux-256color";
        plugins = with pkgs.tmuxPlugins; [
            vim-tmux-navigator
        ] ++ theme;
        extraConfig = ''
  # Empty line before status bar
  set -Fg 'status-format[1]' '#{status-format[0]}'
  set -g 'status-format[0]' ""
  set -g status 2
        '';
    };
}
