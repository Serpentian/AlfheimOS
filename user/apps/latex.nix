{pkgs, ...}:
{
    home.packages = with pkgs; [
        rubber
        (texlive.combined.scheme-full.withPackages (ps: [
            ps.cyrillic
            ps.cyrillic-bin
            ps.collection-langcyrillic
            ps.context-cyrillicnumbers
        ]))
    ];
}
