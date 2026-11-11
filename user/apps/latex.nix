{pkgs, ...}:
{
    home.packages = with pkgs; [
        rubber
        (texliveFull.withPackages (ps: [
            ps.cyrillic
            ps.cyrillic-bin
            ps.collection-langcyrillic
            ps.context-cyrillicnumbers
        ]))
    ];
}
