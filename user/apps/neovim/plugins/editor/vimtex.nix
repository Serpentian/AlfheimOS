{pkgs, ...}:
{
    home.packages = with pkgs; [
        (texlive.combined.scheme-full.withPackages (ps: [
            ps.cyrillic
            ps.cyrillic-bin
            ps.collection-langcyrillic
            ps.context-cyrillicnumbers
        ]))
    ];

    programs.nixvim.plugins.vimtex = {
        enable = true;
    };
}
