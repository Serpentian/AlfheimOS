{pkgs, lib, ...}:
{
    environment.systemPackages = with pkgs; [
        (python3.withPackages (pyPkgs: with pyPkgs; [ pygobject3 ]))
        evolution
    ];

    services.gnome.evolution-data-server.enable = true;
    environment.sessionVariables = {
        GI_TYPELIB_PATH = lib.makeSearchPath "lib/girepository-1.0" (
            with pkgs;
            [
                evolution-data-server
                libical
                glib.out
                libsoup_3
                json-glib
                gobject-introspection
            ]
        );
    };
}
