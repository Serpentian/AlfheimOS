{ config, lib, pkgs, inputs, ...}:
{
    programs.opencode = {
        enable = true;
        # package = inputs.opencode.packages.${pkgs.stdenv.hostPlatform.system}.opencode;
        # Keep Stylix's theme while it still targets OpenCode 1's tui.json.
        tui = lib.mkForce {};
        cli.theme.name = lib.mkIf config.stylix.targets.opencode.enable "stylix";
    };

    home.packages = with pkgs; [
        # claude-code
        _codex-bin
    ];
}
