{
    description = "Nix shell for ComfyUI";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system: let
            pkgs = import nixpkgs { inherit system; };
        in
        {
            devShells.default = pkgs.mkShell {
                packages = [
                    # Installation.
                    (pkgs.python311.withPackages (python-pkgs: [
                        python-pkgs.pip
                        python-pkgs.virtualenv
                    ]))
                ];

                LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (with pkgs; [
                    stdenv.cc.cc.lib
                    zlib
                    zstd
                    glib
                    libGL

                    xorg.libxcb
                    xorg.libX11
                    xorg.libXext
                    xorg.libXrender
                ]);

                shellHook = ''
                    cd $HOME/Programming/ComfyUI
                    source $HOME/Programming/ComfyUI/.venv/bin/activate
                '';

                # LD_LIBRARY_PATH =
                #     "${pkgs.stdenv.cc.cc.lib}/lib/:${pkgs.libGL}/lib/:${pkgs.glib.out}/lib/:${pkgs.zlib.out}/lib/:${pkgs.zstd.out}/lib/:$LD_LIBRARY_PATH";
            };
        });
}
