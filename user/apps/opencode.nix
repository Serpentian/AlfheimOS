{ pkgs, inputs, ...}:
{
    programs.opencode = {
        enable = true;
        # package = inputs.opencode.packages.${pkgs.system}.opencode;
    };

    programs.codex = {
        enable = true;
    }
}
