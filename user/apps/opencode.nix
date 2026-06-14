{ pkgs, inputs, ...}:
{
    programs.opencode = {
        enable = true;
        # package = inputs.opencode.packages.${pkgs.system}.opencode;
    };

    home.packages = with pkgs; [
        claude-code
    ];
}
