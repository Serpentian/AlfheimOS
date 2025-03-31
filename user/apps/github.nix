{pkgs, ...}:
{
    programs.gh = {
        enable = true;
        settings = {
            git_protocol = "ssh";
        };
    };

    programs.gh-dash = {
        enable = true;
    };
}
