{pkgs, ...}:
{
    programs.thunar = {
        enable = true;
        plugins = with pkgs; [
            thunar-archive-plugin
            peazip
        ];
    };
}
